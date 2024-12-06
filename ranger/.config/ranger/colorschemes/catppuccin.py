# ~/.config/ranger/colorschemes/catppuccin.py

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Catppuccin(ColorScheme):
    # Define the Catppuccin colors
    colors = {
        'rosewater': 224,
        'flamingo': 217,
        'pink': 212,
        'mauve': 141,
        'red': 167,
        'maroon': 161,
        'peach': 209,
        'yellow': 179,
        'green': 108,
        'teal': 115,
        'sky': 117,
        'sapphire': 111,
        'blue': 110,
        'lavender': 183,
        'text': 249,  # Text color
        'subtext': 245,  # Subtext color
        'overlay': 240,  # Overlay/background color
    }

    def use(self, context):
        fg, bg, attr = default_colors

        # Reset context
        if context.reset:
            return default_colors

        # File browser view
        if context.in_browser:
            if context.selected:
                # bg = self.colors['blue']
                # bg = self.colors['peach']
                fg = self.colors['text']
                attr = reverse  # Highlight the selected item
            elif context.empty or context.error:
                fg = self.colors['maroon']
            elif context.border:
                fg = self.colors['overlay']
            elif context.media:
                fg = self.colors['pink']
            elif context.document:
                fg = self.colors['green']
            elif context.directory:
                # fg = self.colors['blue']
                fg = self.colors['peach']
                attr = bold
            elif context.executable and not context.directory:
                fg = self.colors['teal']
                attr = bold
            elif context.link:
                fg = self.colors['sky']
            elif context.bad:
                fg = self.colors['red']
            elif context.tag_marker and not context.selected:
                fg = self.colors['yellow']
            elif context.cut or context.copied:
                fg = self.colors['overlay']
                attr |= bold | dim

        # Status bar
        elif context.in_statusbar:
            if context.permissions:
                fg = self.colors['maroon'] if context.good else self.colors['red']
            if context.marked:
                attr |= bold | reverse
                fg = self.colors['yellow']
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = self.colors['red']
                elif context.loaded:
                    fg = self.colors['green']
            if context.directory:
                fg = self.colors['mauve']

        # Titlebar (path at the top)
        elif context.in_titlebar:
            attr |= bold
            fg = self.colors['lavender'] if context.hostname else self.colors['text']

        # Tabs
        elif context.tab:
            if context.good:
                bg = self.colors['green']

        # Marked files
        if context.marked:
            attr |= bold
            fg = self.colors['flamingo']

        # Set file progress bar color
        # if context.progress_bar:
        #     fg = self.colors['sky']

        return fg, bg, attr

