class Project {
  final String name;
  final String description;
  final String image;
  final String link;
  final String video;
  Project(this.name, this.description, this.image, this.link,this.video);
}

List<Project> projectList = [
  Project(
    'ADB LMS',
    'Presenting "ADB LMS" - The ADB LMS is a specialized learning management system designed to meet the specific training needs of the Asian Development Bank (ADB) and Bangladesh Bank. This platform serves as a comprehensive digital hub for professional development, offering a wide array of educational resources tailored to the unique demands of these financial institutions.',
    'assets/images/adb.png',
    'https://github.com/abir1h/ADB-LMS',''
  ),
  Project(
    'E-Library',
    "The eLibrary app, developed using Flutter, is a dynamic and user-friendly digital library platform designed to provide users with easy access to a wide range of reading materials. Built with a focus on cross-platform compatibility, the app offers a seamless experience on both iOS and Android devices, leveraging Flutter's capabilities to deliver smooth performance and a consistent user interface.",
    'assets/images/elib.png',
    'https://github.com/abir1h/elib/tree/stage',""
  ),
  Project(
      'Restaurant Booking System',
      'This is a Flutter Mobile  application that enables customers to make and manage reservations online, offering real-time availability and reducing the risk of overbooking. It helps restaurants optimize their seating arrangements by managing table layouts and automating reservation assignments. The system also maintains customer profiles, sends reservation confirmations and reminders, and integrates with POS systems for streamlined service. Additionally, it provides valuable analytics and reporting on booking trends and customer preferences. By improving reservation management and offering personalized customer experiences, the system enhances operational efficiency and boosts revenue.',
      'assets/images/go_banner.png',
      'false',""),
  Project(
      'Ecommerce Application',
      'CUI AIDER is an extraordinary application that brings together augmented reality (AR), a robust student portal, intuitive class management, and a comprehensive GPA system, providing an all-encompassing solution for students.Using AR technology, CUI AIDER offers an immersive experience, allowing users to explore the complete university campus virtually. Through AR, students can visualize buildings, navigate with interactive directions, and gain a better understanding of their surroundings.',
      'assets/images/cui.png',
      'https://github.com/abir1h/Ecommerce/tree/Abir',"d-7j0cmtI9g"),

];
