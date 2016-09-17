package org.specter3d.configs.camera
{
   public class CameraFileVo
   {
       
      
      private var _cameraVoList:Vector.<org.specter3d.configs.camera.CameraVO>;
      
      public var fileName:String;
      
      public var time:int;
      
      public function CameraFileVo()
      {
         super();
      }
      
      public function get cameraVoList() : Vector.<org.specter3d.configs.camera.CameraVO>
      {
         return _cameraVoList;
      }
      
      public function set cameraVoList(param1:Vector.<org.specter3d.configs.camera.CameraVO>) : void
      {
         var _loc2_:int = 0;
         this._cameraVoList = new Vector.<org.specter3d.configs.camera.CameraVO>();
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            this._cameraVoList.push(param1[_loc2_].clone());
            _loc2_++;
         }
      }
      
      public function toString() : String
      {
         return fileName;
      }
   }
}
