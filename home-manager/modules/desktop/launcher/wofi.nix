{
 programs.wofi = {
  enable = true;
  settings = {
   location = "middle";
   allow_markup = true;
   allow_image = true;
   width = 500;
   height = 500;
  };
 
style =
     ''
* 
window {
  margin: 0px;
  border: 5px solid;
  background-color: #1d2021;
  font-family: "Fira Mono Nerd Font";
  font-weight: bold;
  font-size: 16px;
}

#input {
  margin: 5px;
  border: none;
  color: #ffffff;
  background-color: #1d2021;
}

#inner-box {
  margin: 5px;
  border: none;
  background-color: #282828;
}

#outer-box {
  margin: 5px;
  border: none;
  background-color: #282828;
}

#scroll {
  margin: 0px;
  border: none;
}

#text {
  margin: 5px;
  border: none;
  color: #ffffff;
}

#entry:selected {
  background-color: #d65d0e;
  color: #ffffff;
}

      ''; 
 };
}
