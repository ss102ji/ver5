from pptx.dml.color import RGBColor

# Retry creating the PowerPoint with the corrected imports
# Create a new PowerPoint presentation
presentation = Presentation()

# Add a title slide
slide = presentation.slides.add_slide(presentation.slide_layouts[0])
title = slide.shapes.title
subtitle = slide.placeholders[1]
title.text = "AS-IS Process Map for Preparing Annual Performance Review Letters"
subtitle.text = "Detailed steps for manual preparation"

# Add a slide for the process map
slide = presentation.slides.add_slide(presentation.slide_layouts[5])

# Set positioning parameters
left_margin = Inches(0.5)
top_margin = Inches(0.5)
width = Inches(5.5)
height = Inches(0.6)
vertical_spacing = Inches(1.0)

# Define steps for the process map
steps = [
    "1. Collect Documents:\n- Employees.xlsx\n- PerformanceReviewDoc_template\n- Manager Feedback File\n- Project Details File",
    "2. Open PerformanceReviewDoc_template.docx",
    "3. Populate Employee Information:\n- Copy 'Direct Manager Rating' and 'Department Manager Rating' from Employees.xlsx\n"
    "- Copy Personal Info: Full-time/Part-time, Location, Position Title, Direct Manager",
    "4. Include Manager Feedback:\n- Copy text from ManagerFeedback.txt\n- Paste into 'Manager Feedback' section",
    "5. Include Project Details:\n- Copy relevant details from Project Excel\n- Paste into 'Projects Section'",
    "6. Final Review and Save:\n- Verify all fields\n- Save as EmployeeName_PerformanceReview.docx",
    "7. Repeat Steps 2-6 for all employees in Employees.xlsx"
]

# Add each step to the slide as a shape
for i, step_text in enumerate(steps):
    step_shape = slide.shapes.add_shape(
        MSO_SHAPE.RECTANGLE,
        left_margin,
        top_margin + i * vertical_spacing,
        width,
        height,
    )
    step_shape.text = step_text
    # Style the shape
    fill = step_shape.fill
    fill.solid()
    fill.fore_color.rgb = RGBColor(240, 248, 255)  # Light blue
    line = step_shape.line
    line.color.rgb = RGBColor(0, 0, 0)  # Black outline
    # Format the text
    text_frame = step_shape.text_frame
    for paragraph in text_frame.paragraphs:
        paragraph.font.size = Pt(14)

# Save the presentation
file_path = "/mnt/data/AS-IS_Process_Map.pptx"
presentation.save(file_path)
file_path
