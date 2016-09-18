package nslm2.modules.roleInfos.tupos
{
   import morn.core.components.Component;
   
   public class RoleTupoSuccessInitVo
   {
       
      
      public var stcNpcId:int;
      
      public var titleUrl:String;
      
      public var addComponent:Component;
      
      public var addComponentX:int;
      
      public var addComponentY:int;
      
      public function RoleTupoSuccessInitVo(param1:int, param2:String, param3:Component = null, param4:int = 0, param5:int = 0)
      {
         super();
         stcNpcId = param1;
         titleUrl = param2;
         addComponent = param3;
         addComponentX = param4;
         addComponentY = param5;
      }
   }
}
