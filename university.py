import mysql.connector

# Function to connect to the database
def connect_to_database():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="HIBA",
            password="102938AFhn",
            database="university"
        )
        return connection
    except mysql.connector.Error as error:
        print("Error connecting to database:", error)
        return None

# Function to fetch and display all courses
def fetch_courses(connection):
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Course")
        rows = cursor.fetchall()
        print("\nCourses:")
        for row in rows:
            print(row)
    except mysql.connector.Error as error:
        print("Failed to fetch courses:", error)

# Function to fetch and display all departments
def fetch_departments(connection):
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Department")
        rows = cursor.fetchall()
        print("\nDepartments:")
        for row in rows:
            print(row)
    except mysql.connector.Error as error:
        print("Failed to fetch departments:", error)

# Function to enroll a student in a course
def enroll_in_course(connection, student_id, section_number):
    try:
        cursor = connection.cursor()
        cursor.execute("INSERT INTO Studies_in (StudentID, Section_number) VALUES (%s, %s)", (student_id, section_number))
        connection.commit()
        print("Enrolled in course successfully!")
    except mysql.connector.Error as error:
        print("Failed to enroll in course:", error)

# Function to fetch and display teaching schedule for a faculty member
def fetch_teaching_schedule(connection, faculty_id):
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Section WHERE FacultyID = %s", (faculty_id,))
        rows = cursor.fetchall()
        print("\nTeaching Schedule:")
        for row in rows:
            print(row)
    except mysql.connector.Error as error:
        print("Failed to fetch teaching schedule:", error)

# Function to view students enrolled in a specific section
def view_enrolled_students(connection, faculty_id, section_number):
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT s.StudentID, s.Name FROM Studies_in si JOIN Student s ON si.StudentID = s.StudentID WHERE si.Section_number = %s", (section_number,))
        rows = cursor.fetchall()
        print("\nEnrolled Students:")
        for row in rows:
            print(row)
    except mysql.connector.Error as error:
        print("Failed to fetch enrolled students:", error)

# Function to fetch and display student information
def fetch_student_info(connection, student_id):
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Student WHERE StudentID = %s", (student_id,))
        row = cursor.fetchone()
        print("\nStudent Information:")
        print(row)
    except mysql.connector.Error as error:
        print("Failed to fetch student information:", error)

# Function to search for courses by name
def search_courses(connection, course_name):
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Course WHERE Course_Name LIKE %s", ("%" + course_name + "%",))
        rows = cursor.fetchall()
        print("\nSearch Results:")
        for row in rows:
            print(row)
    except mysql.connector.Error as error:
        print("Failed to search courses:", error)

# Function to update student details
def update_student_details(connection, student_id, new_major):
    try:
        cursor = connection.cursor()
        cursor.execute("UPDATE Student SET Major = %s WHERE StudentID = %s", (new_major, student_id))
        connection.commit()
        print("Student details updated successfully!")
    except mysql.connector.Error as error:
        print("Failed to update student details:", error)

# Function to fetch and display all sections
def fetch_sections(connection):
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Section")
        rows = cursor.fetchall()
        print("\nSections:")
        for row in rows:
            print(row)
    except mysql.connector.Error as error:
        print("Failed to fetch sections:", error)

# Main function to demonstrate database interaction
def main():
    # Connect to the database
    connection = connect_to_database()
    if connection:
        while True:
            print("\nOptions:")
            print("1. View Courses")
            print("2. View Departments")
            print("3. Enroll in Course")
            print("4. Faculty Operations")
            print("5. View Student Information")
            print("6. Search Courses")
            print("7. Update Student Details")
            print("8. View Sections")
            print("9. Exit")
            choice = input("Enter your choice (1-9): ")

            if choice == "1":
                fetch_courses(connection)
            elif choice == "2":
                fetch_departments(connection)
            elif choice == "3":
                student_id = input("Enter your student ID: ")
                section_number = input("Enter section number to enroll in: ")
                enroll_in_course(connection, student_id, section_number)
            elif choice == "4":
                faculty_id = input("Enter faculty ID: ")
                print("\nFaculty Operations:")
                print("1. View Teaching Schedule")
                print("2. View Enrolled Students")
                faculty_choice = input("Enter your choice (1-2): ")
                if faculty_choice == "1":
                    fetch_teaching_schedule(connection, faculty_id)
                elif faculty_choice == "2":
                    section_number = input("Enter section number: ")
                    view_enrolled_students(connection, faculty_id, section_number)
                else:
                    print("Invalid choice!")
            elif choice == "5":
                student_id = input("Enter student ID: ")
                fetch_student_info(connection, student_id)
            elif choice == "6":
                course_name = input("Enter course name to search: ")
                search_courses(connection, course_name)
            elif choice == "7":
                student_id = input("Enter student ID: ")
                new_major = input("Enter new major: ")
                update_student_details(connection, student_id, new_major)
            elif choice == "8":
                fetch_sections(connection)
            elif choice == "9":
                print("Exiting program.")
                break
            else:
                print("Invalid choice!")

        # Close the connection
        connection.close()
        print("Connection closed.")

if __name__ == "__main__":
    main()
