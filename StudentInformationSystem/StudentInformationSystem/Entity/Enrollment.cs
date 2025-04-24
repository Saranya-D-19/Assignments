using System;

namespace SIS.entity
{
    public class Enrollment
    {
        private int enrollmentId;
        private int studentId;
        private int courseId;
        private DateTime enrollmentDate;

        public int EnrollmentId
        {
            get => enrollmentId;
            set => enrollmentId = value;
        }

        public int StudentId
        {
            get => studentId;
            set => studentId = value;
        }

        public int CourseId
        {
            get => courseId;
            set => courseId = value;
        }

        public DateTime EnrollmentDate
        {
            get => enrollmentDate;
            set => enrollmentDate = value;
        }

        // Default constructor
        public Enrollment() { }

        // Parameterized constructor
        public Enrollment(int id, int studentId, int courseId, DateTime date)
        {
            EnrollmentId = id;
            StudentId = studentId;
            CourseId = courseId;
            EnrollmentDate = date;
        }

        public override string ToString()
        {
            return $"Enrollment [ID={EnrollmentId}, StudentID={StudentId}, CourseID={CourseId}, Date={EnrollmentDate.ToShortDateString()}]";
        }
    }
}
