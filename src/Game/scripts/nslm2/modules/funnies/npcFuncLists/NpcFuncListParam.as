package nslm2.modules.funnies.npcFuncLists
{
   import nslm2.modules.scenes.commons.SceneUnit3D;
   
   public class NpcFuncListParam
   {
       
      
      public var npcRelationId:int;
      
      public var npc:SceneUnit3D;
      
      public function NpcFuncListParam(param1:int, param2:SceneUnit3D)
      {
         super();
         this.npcRelationId = param1;
         this.npc = param2;
      }
   }
}
