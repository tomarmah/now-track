# nowtrack

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Aproach::

Full AI Coder Prompt for Flutter App: “NowTrack”

Build a Flutter mobile app called NowTrack that helps users track what they’re working on in real time, reflect on how their day was spent, and improve time management through intentional planning.

The app should have a clean, modern, minimalist UI, support offline-first functionality, and be built for performance and future scalability.

🎯 Core Use Case
Help users:

Start/stop time logs with one tap
Annotate activities with comments, audio, or video
Categorize each session
Plan how they want to spend their time each day
Get daily and monthly performance scores based on how well they stuck to their plan

✅ Core Features

1. Activity Tracking
   Home screen with a central Start/Stop button
   On Start: log timestamp as session start
   On Stop: log session end, then open annotation modal

2. Post-Session Annotation Modal
   After a session ends:

Allow user to:

Add text note (text input)

Record or upload an audio note

Record or attach a video

Select a category for the activity

3. Activity Categorization
   Predefined categories: Work, Exercise, Learning, Admin, Break, etc.

Users can create custom categories (with name, emoji or icon, and soft color)

Each activity is tagged with a selected category

4. Timeline View
   A daily scrollable timeline of all sessions

Each session card displays:

Start & end time

Duration

Category label + icon + color

Comment/audio/video icons

Tapping a session opens full details (with edit options)

5. Time Planning ("Plan My Day")
   Optional daily feature allowing users to allocate time percentages to categories

UI: Sliders or dropdowns for assigning % per category

Must total 100%
Save plan as “Today’s Plan” in local DB

6. Goal Adherence Scoring
   🧮 Logic:
   At end of day, compute actual % of time spent per category

For each category:
accuracy = 100 - ABS(actual% - planned%)
Average all category accuracies to get a daily adherence score (0–100)

🎓 Grade Mapping:
Grade Score Range Meaning
A+ 95–100 Excellent
A 85–94.9 Good
B 70–84.9 Average
C 50–69.9 Below Average
D 0–49.9 Not Good

Store daily scores and calculate monthly average

Assign a monthly grade using same scale

7. Reports & Analytics
   Dedicated Reports Screen with:

Daily, weekly, monthly filters

Bar or Pie chart showing time spent per category

Time goal adherence score for the day/month

Grade summary: “You scored A today (92).”

Tips: “Try to reduce Admin time by 10% for better balance.”

Visuals: score ring, color-coded badges, streak counter

🎨 UI & UX Guidelines
Clean, minimalist design using pastel color schemes

Rounded buttons and cards, soft shadows

Use animations for screen transitions and button taps

Visual distinction for categories (icon + color)

Progress rings for scores, streaks, and goals

Optional dark mode toggle

🔧 Technical Stack
Flutter Packages to Use:
State management: Riverpod (or Provider)

Local storage: Hive or SQLite

Audio: flutter_sound or just_audio

Video: image_picker and video_player

Charts: fl_chart or syncfusion_flutter_charts

UI: flutter_animate, flutter_hooks (optional)

🧱 Data Model Overview
Activity
{
id,
start_time,
end_time,
category_id,
comment,
audio_path,
video_path
}

Category
{
id,
name,
icon,
color
}

DailyPlan
{
date,
category_id,
planned_percentage
}

DailyScore
{
date,
actual_breakdown: Map<category_id, percentage>,
score,
grade
}

📱 Screens to Implement
Home Screen - Start/Stop button - Today’s overview or CTA to view logs - Post-Session Modal - Text field, audio/video recorder, category selector

Timeline Screen

- Daily activity cards with time & category info

Plan My Day Screen

- Assign % to categories (with sliders, enforce 100%)

Reports Screen

- Visual charts of time spent vs plan
- Daily & monthly scores and grades
- Feedback & tips
- Score history and streaks

Category Manager

- Add/edit/delete categories with emoji or icon

Settings (Optional)

- Dark mode toggle
- Export data (CSV or JSON)
- Notification preferences

🌱 Future Enhancements (structure code for these)

- AI suggestions: "Spend less on Admin tomorrow"
- Smart reminders: "Start Work session?"
- Cloud sync or backup
- Shared goals or accountability circle
- Focus mode (prevent switching during session)
