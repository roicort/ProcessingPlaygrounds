import processing.svg.*;

float save;
File selection;

void saveFile(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    PGSVG(stair,selection.getAbsolutePath()+".svg"); //drawingfunction
  }
}

void savepromt(){
  selectOutput("Select a file to write to:", "saveFile");
  saveFile(selection);
  selection = null;
}
