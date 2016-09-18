package nslm2.modules.footstones.tipMenus
{
   public class TipMenuConfigVo
   {
       
      
      public var iconId:int;
      
      public var name:String;
      
      public var handlerClass:Class;
      
      public var showRedPoint:Boolean;
      
      public function TipMenuConfigVo(param1:int, param2:String, param3:Class, param4:Boolean = false)
      {
         super();
         this.iconId = param1;
         this.name = param2;
         this.handlerClass = param3;
         this.showRedPoint = param4;
      }
   }
}
