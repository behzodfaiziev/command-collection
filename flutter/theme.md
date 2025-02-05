## 🚀 Primary, Secondary, and Tertiary Colors
### 🔶 Primary & OnPrimary
✔ Use when:

- The most important and prominent elements in your UI (e.g., buttons, app bars, active navigation elements).
- Primary text (when used on surfaces with sufficient contrast).

❌ Avoid when:
- Using primary text on a background that does not provide enough contrast.

✅ Example Usage:

- Primary: Button background, FAB (Floating Action Button), AppBar, active icons.
- OnPrimary: Text/icons placed on primary-colored backgrounds.

## 🟤 Secondary & OnSecondary
✔ Use when:

- Supporting elements that complement the primary color.
- Less prominent UI parts like chips, outlines, toggles, dividers.

❌ Avoid when:

- Making secondary elements more dominant than primary elements.
- Applying it to high-emphasis buttons (primary should be used instead).

✅ Example Usage:

Secondary: Outlined buttons, chips, small floating actions.
OnSecondary: Text/icons placed on secondary-colored backgrounds.

## 🔷 Tertiary & OnTertiary
✔ Use when:

An additional accent color for further differentiation in UI.
Used for special purposes, such as warnings or optional features.
❌ Avoid when:

- Overusing tertiary instead of primary/secondary.
- Making it the dominant color of the theme.

✅ Example Usage:

- Tertiary: Special UI elements like progress bars, highlights, or key UI sections.
- OnTertiary: Text/icons placed on tertiary-colored backgrounds.
## 📦 Containers & Fixed Colors
- Containers help group elements together with different shades of primary, secondary, and tertiary.

### PrimaryContainer & OnPrimaryContainer
✔ Use when:
- A variant of primary color for backgrounds of UI components.
- Used in cards, banners, and text fields.

❌ Avoid when:

- Using it for primary elements like buttons (use Primary instead).
- Overlapping it with background colors.

✅ Example Usage:
- PrimaryContainer: Card background, dialog boxes, popups.
- OnPrimaryContainer: Text/icons placed on primary container backgrounds.
## SecondaryContainer & OnSecondaryContainer
✔ Use when:
- Secondary background elements like bottom navigation, side menus.

❌ Avoid when:
- Using it for large surface areas (stick to surface colors).
- Using it in high-contrast areas.
✅ Example Usage:
- SecondaryContainer: Drawer background, Chip backgrounds.
- OnSecondaryContainer: Text/icons on secondaryContainer.

## TertiaryContainer & OnTertiaryContainer
✔ Use when:
- An additional accent background.
- Highlights special UI elements.

❌ Avoid when:
- Overcomplicating the design with too many tertiary colors.
✅ Example Usage:

- TertiaryContainer: Special alert backgrounds, Progress indicators.
- OnTertiaryContainer: Text/icons on tertiaryContainer.
## 🎭 Surface Colors & Usage
- Surface colors define the main UI background elements.

### Surface & OnSurface
✔ Use when:
- Backgrounds of components such as cards, modals, menus, sheets.
❌ Avoid when:
- Using it for key buttons or text fields (use PrimaryContainer instead).

✅ Example Usage:
- Surface: Card background, BottomSheet background.
- OnSurface: Text/icons placed on surfaces.
## Inverse Colors (InverseSurface & OnInverseSurface)
✔ Use when:
- Displaying UI in contrast mode (e.g., dark backgrounds in light mode).

❌ Avoid when:
- Used too often; it’s meant for special cases only.

✅ Example Usage:
- InverseSurface: Dark mode toggles, Status bars in contrast mode.
- OnInverseSurface: Text/icons on inverse surfaces.
## ⚠ Error Colors
- Error & OnError: Used for critical error states.
- ErrorContainer & OnErrorContainer: Backgrounds of error messages.

| Color Role    | Usage |
| -------- | ------- |
| primary  | Main UI elements (buttons, app bars).   |
| onPrimary | Text/icons on primary-colored backgrounds.     |
| secondary    | Supporting UI elements (chips, switches).    |
| onSecondary   | Text/icons on secondary backgrounds.    |
| tertiary    |  Additional accent color (highlights, indicators).   |
| onTertiary    |  Text/icons on tertiary backgrounds.   |
| primaryContainer    |  Background for cards, modals, banners.   |
| onPrimaryContainer    |  Text/icons on primary container backgrounds.   |
| secondaryContainer    |  Background for drawer, bottom nav.   |
| onSecondaryContainer    |  Text/icons on secondary container.   |
| tertiaryContainer    |  Background for special alerts.   |
| onTertiaryContainer    |  Text/icons on tertiary container.   |
| surface    |  Main UI background color.   |
| onSurface    |  Text/icons on surface color.   |
| error    |  Critical error elements.   |
| onError    |  Text/icons on error background.   |
