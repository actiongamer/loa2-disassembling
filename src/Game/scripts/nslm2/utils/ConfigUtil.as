package nslm2.utils
{
   import morn.core.utils.StringUtils;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import org.specter3d.display.avatar2.Avatar3D;
   import away3d.core.base.Object3D;
   import flash.geom.Vector3D;
   
   public class ConfigUtil
   {
      
      public static const KEY:String = "heroInfoUI";
      
      public static const KEY_MODEL3D:String = "model3d";
      
      public static const HAS_ACTION:String = "hasAction";
      
      public static const WIN_RO:String = "winRo";
      
      public static const BOTH_SIDES:String = "bothSides";
      
      public static const ALPHAT_HRESHOLD:String = "alphaThreshold";
      
      public static const TRANSFORM:String = "transform";
      
      public static const POSITION:String = "position";
      
      public static const EULERS:String = "eulers";
      
      public static const SCALLS:String = "scalls";
      
      public static const ENV_MAP:String = "envMap";
       
      
      public function ConfigUtil()
      {
         super();
      }
      
      public static function getBothSides(param1:String, param2:Boolean = true) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         try
         {
            if(StringUtils.isNull(param1) == false)
            {
               _loc3_ = JSON.parse(param1);
               if(_loc3_.hasOwnProperty("model3d"))
               {
                  _loc4_ = _loc3_["model3d"];
                  if(_loc4_.hasOwnProperty("bothSides"))
                  {
                     var _loc6_:* = StringUtils.boolVal(_loc4_["bothSides"]);
                     return _loc6_;
                  }
               }
            }
         }
         catch($err:Error)
         {
         }
         return param2;
      }
      
      public static function getWinRo(param1:String) : int
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         try
         {
            if(StringUtils.isNull(param1) == false)
            {
               _loc2_ = JSON.parse(param1);
               if(_loc2_.hasOwnProperty("model3d"))
               {
                  _loc3_ = _loc2_["model3d"];
                  if(_loc3_.hasOwnProperty("winRo"))
                  {
                     var _loc5_:* = _loc3_["winRo"];
                     return _loc5_;
                  }
               }
            }
         }
         catch($err:Error)
         {
         }
         return 0;
      }
      
      public static function getHasAction(param1:String) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         try
         {
            if(StringUtils.isNull(param1) == false)
            {
               _loc2_ = JSON.parse(param1);
               if(_loc2_.hasOwnProperty("model3d"))
               {
                  _loc3_ = _loc2_["model3d"];
                  if(_loc3_.hasOwnProperty("hasAction"))
                  {
                     var _loc5_:* = _loc3_["hasAction"];
                     return _loc5_;
                  }
               }
            }
         }
         catch($err:Error)
         {
         }
         return true;
      }
      
      public static function setWeaponUIExtra(param1:UIWeapon3D, param2:String) : void
      {
         var _loc4_:* = null;
         var _loc3_:Object = JSON.parse(param2);
         if(_loc3_.hasOwnProperty("weaponUI"))
         {
            _loc4_ = _loc3_["weaponUI"];
            if(_loc4_.hasOwnProperty("transform"))
            {
               fromTransfrom(param1,_loc4_["transform"]);
            }
            if(_loc4_.hasOwnProperty("envMap"))
            {
               param1.extra_envMap = _loc4_["envMap"];
            }
            else
            {
               param1.extra_envMap = null;
            }
         }
      }
      
      public static function setExtra(param1:Avatar3D, param2:String) : void
      {
         var _loc5_:* = null;
         var _loc3_:Object = JSON.parse(param2);
         if(_loc3_.hasOwnProperty("model3d"))
         {
            _loc5_ = _loc3_["model3d"];
            var _loc7_:int = 0;
            var _loc6_:* = _loc5_;
            for(var _loc4_ in _loc5_)
            {
               if(param1.hasOwnProperty(_loc4_))
               {
                  param1[_loc4_] = _loc5_[_loc4_];
               }
            }
         }
      }
      
      public static function fromTransfrom(param1:Object3D, param2:Object) : void
      {
         var _loc3_:* = null;
         if(param2.hasOwnProperty("position"))
         {
            _loc3_ = param2["position"];
            param1.position = new Vector3D(_loc3_[0],_loc3_[1],_loc3_[2]);
         }
         if(param2.hasOwnProperty("eulers"))
         {
            _loc3_ = param2["eulers"];
            param1.eulers = new Vector3D(_loc3_[0],_loc3_[1],_loc3_[2]);
         }
         if(param2.hasOwnProperty("scalls"))
         {
            _loc3_ = param2["scalls"];
            param1.scaleX = _loc3_[0];
            param1.scaleY = _loc3_[1];
            param1.scaleZ = _loc3_[2];
         }
      }
      
      public static function toTransfrom(param1:Object3D) : Object
      {
         var _loc2_:Object = {};
         _loc2_["position"] = [param1.x,param1.y,param1.z];
         _loc2_["eulers"] = [param1.rotationX,param1.rotationY,param1.rotationZ];
         _loc2_["scalls"] = [param1.scaleX,param1.scaleY,param1.scaleZ];
         return _loc2_;
      }
   }
}
