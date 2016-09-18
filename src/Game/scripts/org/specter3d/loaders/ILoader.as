package org.specter3d.loaders
{
   public interface ILoader
   {
       
      
      function loadOne(param1:ResourceVo, param2:Function = null, param3:String = "default_group") : void;
      
      function loads(param1:Vector.<ResourceVo>, param2:Function = null, param3:String = "default_group") : void;
      
      function clean() : void;
      
      function isLoading() : Boolean;
   }
}
