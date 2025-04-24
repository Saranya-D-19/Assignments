using System;

namespace SIS.entity
{
    public class Course
    {
        private int courseId;
        private string courseName = string.Empty;
        private string courseCode = string.Empty;
        private string instructorName = string.Empty;

        public int CourseId
        {
            get => courseId;
            set => courseId = value;
        }

        public string CourseName
        {
            get => courseName;
            set => courseName = value ?? throw new ArgumentNullException(nameof(CourseName));
        }

        public string CourseCode
        {
            get => courseCode;
            set => courseCode = value ?? throw new ArgumentNullException(nameof(CourseCode));
        }

        public string InstructorName
        {
            get => instructorName;
            set => instructorName = value ?? throw new ArgumentNullException(nameof(InstructorName));
        }

        // Default constructor
        public Course() { }

        // Parameterized constructor
        public Course(int id, string name, string code, string instructor)
        {
            CourseId = id;
            CourseName = name;
            CourseCode = code;
            InstructorName = instructor;
        }

        public override string ToString()
        {
            return $"Course [ID={CourseId}, Name={CourseName}, Code={CourseCode}, Instructor={InstructorName}]";
        }
    }
}
