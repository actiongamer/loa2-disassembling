package nslm2.modules.foundations.miniMaps
{
   public class MiniMapNpcVisibleVo
   {
       
      
      public var stageNpcRelationId:int;
      
      public var visible:Boolean;
      
      public function MiniMapNpcVisibleVo(param1:int, param2:Boolean)
      {
         super();
         stageNpcRelationId = param1;
         visible = param2;
      }
   }
}
