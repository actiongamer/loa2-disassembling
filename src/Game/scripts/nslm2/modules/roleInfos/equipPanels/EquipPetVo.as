package nslm2.modules.roleInfos.equipPanels
{
   import com.netease.protobuf.UInt64;
   
   public class EquipPetVo
   {
       
      
      public var heroId:UInt64;
      
      public var position:uint;
      
      public var petId:int;
      
      public var swapEquipCallBack:Function;
      
      public function EquipPetVo(param1:UInt64, param2:uint, param3:int = 0, param4:* = null)
      {
         super();
         this.heroId = param1;
         this.position = param2;
         this.petId = param3;
         this.swapEquipCallBack = param4;
      }
   }
}
