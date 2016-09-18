package nslm2.modules.roleInfos.equipPanels
{
   import com.netease.protobuf.UInt64;
   
   public class EquipHeroPosVo
   {
       
      
      public var heroId:UInt64;
      
      public var pos:uint;
      
      public var had:Boolean = false;
      
      public var tabIndex:int;
      
      public var swapEquipCallBack:Function;
      
      public function EquipHeroPosVo(param1:UInt64, param2:uint, param3:Boolean, param4:* = null)
      {
         super();
         this.heroId = param1;
         this.pos = param2;
         this.had = param3;
         this.swapEquipCallBack = param4;
      }
   }
}
