package tools.embattles
{
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.StcLackFatal;
   
   public class EmbattleNpcVo
   {
       
      
      public var selected:Boolean;
      
      public var isMajor:Boolean;
      
      public var stcNpcVo:StcNpcVo;
      
      public var pos:int;
      
      public function EmbattleNpcVo(param1:int, param2:int, param3:Boolean = false)
      {
         super();
         this.npcId = param2;
         this.pos = param1;
         this.isMajor = param3;
      }
      
      public function set npcId(param1:int) : void
      {
         if(param1 > 0)
         {
            stcNpcVo = StcMgr.ins.getNpcVo(param1);
            if(stcNpcVo == null)
            {
               new StcLackFatal(this,"static_npc",param1);
            }
         }
         else
         {
            this.stcNpcVo = null;
         }
      }
      
      public function get npcId() : int
      {
         if(this.stcNpcVo)
         {
            return this.stcNpcVo.id;
         }
         return 0;
      }
      
      public function toOb() : Object
      {
         var _loc1_:Object = {};
         _loc1_.pos = this.pos;
         _loc1_.isMajor = this.isMajor;
         _loc1_.npcId = this.npcId;
         return _loc1_;
      }
      
      public function parseOb(param1:Object) : void
      {
         this.pos = param1.pos;
         this.isMajor = param1.isMajor;
         this.npcId = param1.npcId;
      }
   }
}
