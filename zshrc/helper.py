#!/usr/bin/env python3
"""
Universal Help System - Auto-generates help displays from YAML configuration.
Handles automatic grid generation, column optimization, and section splitting.
"""

import sys
import os
import math
import shutil
from typing import Dict, List, Tuple

try:
    import yaml
except ImportError:
    print("Error: PyYAML not installed. Install with: pip install pyyaml")
    sys.exit(1)

# ANSI Color codes
COLORS = {
    'title': '\033[1;34m',      # Bold blue
    'header': '\033[1;33m',     # Bold yellow
    'command': '\033[1;32m',    # Bold green
    'gray': '\033[1;90m',       # Bold gray
    'reset': '\033[0m'
}


def load_config(yaml_path: str) -> Dict:
    """Load YAML configuration from file."""
    if not os.path.exists(yaml_path):
        print(f"Error: Configuration file not found: {yaml_path}")
        sys.exit(1)

    try:
        with open(yaml_path, 'r') as f:
            config = yaml.safe_load(f)
        return config
    except yaml.YAMLError as e:
        print(f"Error parsing YAML: {e}")
        sys.exit(1)


def dict_to_items(items_dict: Dict[str, str]) -> List[Tuple[str, str]]:
    """Convert dict items to list of (cmd, desc) tuples."""
    return [(cmd, desc) for cmd, desc in items_dict.items()]


def pad_section(items: List[Tuple[str, str]]) -> List[Tuple[str, str]]:
    """Pad section to 9 items with empty entries."""
    items = items.copy()
    while len(items) < 9:
        items.append(("", ""))
    return items


def split_section(name: str, items: List[Tuple[str, str]]) -> List[Tuple[str, List[Tuple[str, str]]]]:
    """
    Split large sections into evenly-sized parts.
    Returns list of (section_name, padded_items) tuples.

    Algorithm:
    - ≤9 items: Return as-is, padded to 9
    - >9 items: Split evenly with "Part N" labels
      - num_parts = ceil(items / 9)
      - Distribute items as evenly as possible
      - Each part padded to 9 rows
    """
    if len(items) <= 9:
        return [(name, pad_section(items))]

    num_parts = math.ceil(len(items) / 9)
    per_part = len(items) // num_parts
    remainder = len(items) % num_parts

    parts = []
    idx = 0
    for i in range(num_parts):
        size = per_part + (1 if i < remainder else 0)
        part_items = items[idx:idx + size]
        part_name = f"{name} (Part {i+1})"
        parts.append((part_name, pad_section(part_items)))
        idx += size

    return parts


def calculate_layout(sections: List[Tuple[str, List[Tuple[str, str]]]], term_width: int) -> Tuple[int, int, int, int]:
    """
    Calculate optimal grid layout with uniform column widths across entire topic.

    Returns: (num_columns, cmd_width, desc_width, col_width)

    All columns in the output will have identical cmd_width and desc_width to maintain
    uniform alignment across all rows. cmd_width and desc_width are calculated from
    the longest command and description found in ANY section of this topic.
    """
    # Find maximum command width across entire topic
    max_cmd = 0
    for _, items in sections:
        for cmd, desc in items:
            if cmd:
                max_cmd = max(max_cmd, len(cmd))

    cmd_width = max_cmd + 1 if max_cmd > 0 else 1

    # Try column configurations from most to least
    # Dynamically allocate desc_width based on available space
    # Require minimum column width and description width for readability
    MIN_DESC_WIDTH = 10
    MIN_COL_WIDTH = 30

    for num_cols in [4, 3, 2, 1]:
        gaps = (num_cols - 1) * 2  # 2 spaces between columns

        # Available space per column
        available_per_col = (term_width - gaps) // num_cols

        # Calculate desc_width: available - cmd_width - arrow
        arrow_width = 3  # " → "
        potential_desc_width = available_per_col - cmd_width - arrow_width

        # Only use this configuration if both column width and desc_width are reasonable
        if available_per_col >= MIN_COL_WIDTH and potential_desc_width >= MIN_DESC_WIDTH:
            desc_width = potential_desc_width
            col_width = available_per_col
            return num_cols, cmd_width, desc_width, col_width

    # Fallback: 1 column using full width
    desc_width = term_width - cmd_width - 3
    return 1, cmd_width, max(1, desc_width), term_width


def format_item(cmd: str, desc: str, cmd_width: int, desc_width: int) -> str:
    """
    Format a single item with uniform column widths.

    Format: "<cmd> → <desc>" (no leading spaces - renderer adds margin)
    - Commands right-aligned within cmd_width
    - Descriptions left-aligned within desc_width
    """
    arrow = " → "

    # Truncate if needed
    if cmd and len(cmd) > cmd_width:
        cmd = cmd[:cmd_width-3] + "..."
    if desc and len(desc) > desc_width:
        desc = desc[:desc_width-3] + "..."

    # Format with alignment (no leading "  " - handled by renderer)
    return f"{cmd:>{cmd_width}}{arrow}{desc:<{desc_width}}"


def render_topic(topic_data: Dict, term_width: int):
    """
    Render a complete help topic with automatic grid generation.
    """
    # Print title
    print(f"\n{COLORS['title']}{topic_data['title']}{COLORS['reset']}\n")

    # Process all sections (convert dict to list, split if >9, pad if ≤9)
    processed_sections = []
    for section_name, items_dict in topic_data['sections'].items():
        # Convert dict {"cmd": "desc"} to list of tuples [("cmd", "desc")]
        items = dict_to_items(items_dict)
        processed_sections.extend(split_section(section_name, items))

    # Calculate optimal grid layout with uniform column widths
    num_cols, cmd_width, desc_width, col_width = calculate_layout(processed_sections, term_width)

    # Render grid row by row
    for row_start in range(0, len(processed_sections), num_cols):
        row_sections = processed_sections[row_start:row_start + num_cols]

        # Print section headers
        header_line = ""
        for col_idx, (name, items) in enumerate(row_sections):
            if col_idx > 0:
                header_line += "  "  # 2-space gap between columns

            header_text = f"# {name}"
            header = f"{COLORS['header']}{header_text}{COLORS['reset']}"
            # Pad header to column width
            padding = col_width - len(header_text)
            header_line += header
            if padding > 0:
                header_line += " " * padding
        print(header_line.rstrip())

        # Print 9 data rows
        for i in range(9):
            line = ""
            for col_idx, (name, items) in enumerate(row_sections):
                if col_idx > 0:
                    line += "  "  # 2-space gap between columns

                cmd, desc = items[i]
                formatted = format_item(cmd, desc, cmd_width, desc_width)

                # Apply green color to command if present
                if cmd:
                    # Replace first occurrence of cmd with colored version
                    formatted = formatted.replace(cmd,
                        f"{COLORS['command']}{cmd}{COLORS['reset']}", 1)

                line += formatted
            print(line.rstrip())

        print()  # Blank line between grid rows

    # Print footer
    if 'footer' in topic_data:
        print(f"\n{COLORS['title']}Tip:{COLORS['reset']} {topic_data['footer']}\n")

    # Print notes if present
    if 'notes' in topic_data:
        for note in topic_data['notes']:
            print(f"{COLORS['gray']}{note}{COLORS['reset']}")
        print()


def main():
    """Main entry point."""
    if len(sys.argv) < 2:
        print("Usage: python3 helper.py <topic>")
        print("Available topics: vimhelp, khelp, kitty_help")
        sys.exit(1)

    topic = sys.argv[1]

    # Load configuration
    script_dir = os.path.dirname(os.path.abspath(__file__))
    yaml_path = os.path.join(script_dir, 'helper.yaml')
    config = load_config(yaml_path)

    # Verify topic exists
    if topic not in config:
        print(f"Error: Unknown topic '{topic}'")
        print(f"Available topics: {', '.join(config.keys())}")
        sys.exit(1)

    # Get terminal width
    term_width = shutil.get_terminal_size().columns

    # Render the topic
    render_topic(config[topic], term_width)


if __name__ == '__main__':
    main()
