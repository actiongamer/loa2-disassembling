package away3d.materials.utils
{
   public function AgalCode(param1:*, param2:String, param3:*, param4:* = null) : String
   {
      if(param4 == null)
      {
         return param2 + " " + param1 + "," + param3 + "\n";
      }
      return param2 + " " + param1 + "," + param3 + "," + param4 + "\n";
   }
}
