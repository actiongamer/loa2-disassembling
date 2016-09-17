package nslm2.modules.scenes.ctrls
{
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncListParam;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncVo;
   
   public class SceneNpcFuncListCtrl extends SceneNpcCtrlBase
   {
       
      
      public function SceneNpcFuncListCtrl()
      {
         super();
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         this.npc = this.scene.addNpcByNpcRelationId(this.npcRelationId);
         if(this.npc)
         {
            this.npc.rotation = -90;
            npc.addEventListener("unitMouseTrigger",npc_onMouse);
            validateFuncCount();
         }
      }
      
      private function enter() : void
      {
         ModuleMgr.ins.showOrCloseModule(41600,new NpcFuncListParam(this.npcRelationId,this.npc));
      }
      
      override protected function runHandler() : void
      {
         super.runHandler();
         if(!needScaleScene)
         {
            this.enter();
         }
      }
      
      override protected function cameraTweenCpl2() : void
      {
         super.cameraTweenCpl2();
         this.enter();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_NPC_FUNC_VO_CHANGE","PLAYER_LEVEL_UP"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         if(this.isDisposed)
         {
            return;
         }
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("MSG_NPC_FUNC_VO_CHANGE" !== _loc4_)
         {
            if("PLAYER_LEVEL_UP" === _loc4_)
            {
               validateFuncCount();
            }
         }
         else
         {
            _loc3_ = param2;
            if(this.npcRelationVo.subFuncIdArr.indexOf(_loc3_) > -1)
            {
               validateFuncCount();
            }
         }
      }
      
      private function validateFuncCount() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         if(this.npc)
         {
            _loc2_ = false;
            _loc3_ = this.npcRelationVo.subFuncIdArr.length;
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc4_ = this.npcRelationVo.subFuncIdArr[_loc5_];
               _loc1_ = NpcFuncService.ins.getVo(_loc4_);
               if(_loc1_ && _loc1_.isLock == false)
               {
                  if(_loc1_.count)
                  {
                     _loc2_ = true;
                     break;
                  }
               }
               _loc5_++;
            }
            npc.tag3DVBox.switchGanTanHao(_loc2_);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
