<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
</head>
<body>

  <h1>🎓 12th Class Board Paper App</h1>
  <p><strong>Access, prepare & excel — easily and offline.</strong></p>

  <hr>

  <h2>📘 Overview</h2>
  <p>
    An educational Flutter app offering <strong>12th-grade board exam previous-year questions (PYQs)</strong>,
    <strong>model/sample papers</strong>, and <strong>marking schemes</strong>.
    Ideal for students preparing comprehensively for CBSE, Maharashtra, UP, and other state boards.
  </p>

  <hr>

  <h2>🚀 Features</h2>
  <ul>
    <li>📚 <strong>Extensive PYQs</strong>: Includes board papers from recent years across major education boards.</li>
    <li>✅ <strong>Solved & Sample Papers</strong>: Practice curated papers aligned with current syllabi.</li>
    <li>📊 <strong>Marking Schemes</strong>: Learn exam scoring strategies.</li>
    <li>🌐 <strong>Offline-ready</strong>: Download papers once and study anytime.</li>
    <li>📝 <strong>Chapter-wise Questions</strong>: For focused revision.</li>
  </ul>

  <hr>

  <h2>📁 Tech Stack</h2>
  <ul>
    <li><strong>Flutter + Dart</strong></li>
    <li>Clean architecture (MVC / Provider / BLoC)</li>
    <li>Local file storage for PDFs</li>
    <li>Responsive UI for Android & iOS</li>
  </ul>

  <hr>

  <h2>🗂️ Directory Structure</h2>
  <pre>
lib/
├── main.dart            # App entry point
├── screens/             # UI pages (Home, Subjects, Paper Viewer, etc.)
├── models/              # Data classes for papers (e.g., PaperModel)
├── providers/           # State management logic (Provider or BLoC)
├── services/            # File handling & PDF utilities
└── widgets/             # Reusable UI components (buttons, tiles, etc.)

assets/
└── papers/              # Sample PDF files

pubspec.yaml             # Dependencies & asset configuration
  </pre>

  <hr>

  <h2>⚙️ Installation</h2>
  <ol>
    <li>
      <strong>Clone the repository:</strong>
      <pre><code>git clone https://github.com/VCodes0/12th-Class-Board-Paper-App.git
cd 12th-Class-Board-Paper-App</code></pre>
    </li>
    <li>
      <strong>Install dependencies:</strong>
      <pre><code>flutter pub get</code></pre>
    </li>
    <li>
      <strong>Run the app:</strong>
      <pre><code>flutter run</code></pre>
    </li>
  </ol>

  <hr>

</body>
</html>
