private class obstacle extends origin {
//this class can only be referenced and/or altered if specifically called from a  class direcly inhertied or calling it specifically
//I did this becase I didn't want the values from obstcale to be changed from any other class

  obstacle(int x, int y, int speedX, int speedY) {
    super( x, y, speedX, speedY);
  }
  
}
