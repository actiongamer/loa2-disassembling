package nslm2.modules.footstones.notices
{
   public class BottomMsgConfigVo
   {
       
      
      public var kind:int;
      
      public var icon:int;
      
      public var name:String;
      
      public var repeat:Boolean;
      
      public function BottomMsgConfigVo(param1:int, param2:int, param3:String, param4:Boolean)
      {
         super();
         this.kind = param1;
         this.icon = param2;
         this.name = param3;
         this.repeat = param4;
      }
   }
}
