package nslm2.modules.footstones.assistantModules.renders
{
   import game.ui.assistantModules.renders.AssisFuncRenderUI;
   import flash.filters.ColorMatrixFilter;
   import flash.display.DisplayObject;
   import com.mz.core.utils.FilterUtil;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcAssistantLevelVo;
   import nslm2.common.model.PlayerModel;
   import proto.TaskGetCurInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.TaskGetCurInfoRes;
   import proto.TaskInfo;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncListParam;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import morn.customs.FilterLib;
   
   public class AssisFuncRender extends AssisFuncRenderUI
   {
      
      private static var grayFilter:ColorMatrixFilter;
       
      
      public function AssisFuncRender()
      {
         super();
         this.parts.push(new RoleGrowFilterMed(this.box_func,FilterLib.BORDER_YELLOW));
         this.check_needAuto.preCondHandler = needAutoClick;
         this.linkGoTo.addEventListener("click",onGoToClickHandler);
         this.linkGoTo.buttonMode = true;
         this.openTips1.text = LocaleMgr.ins.getStr(999000821);
      }
      
      public function get funcId() : int
      {
         return this.dataSource as int;
      }
      
      public function addFilter(param1:DisplayObject, param2:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(grayFilter == null)
         {
            grayFilter = FilterUtil.grayFilter();
         }
         if(param2)
         {
            if(param1.filters.indexOf(grayFilter) < 0)
            {
               _loc4_ = param1.filters;
               _loc4_.push(grayFilter);
               param1.filters = _loc4_;
            }
         }
         else if(param1.filters.indexOf(grayFilter) >= 0)
         {
            _loc3_ = param1.filters;
            ArrayUtil.removeItem(_loc3_,grayFilter);
            param1.filters = _loc3_;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            switchEventListeners(true);
            this.img_bg.url = UrlLib.mainToolBarIcon(this.funcId,"_1");
            _loc2_ = LocaleMgr.ins.getStr(9000000 + this.funcId);
            this.txt_names.text = _loc2_;
            this.check_needAuto.selected = AssistantModel.ins.isNeedAuto(funcId);
            _loc4_ = StcMgr.ins.getAssistantLevelVo(funcId);
            if(this.funcId == 50500 && int(_loc4_.condition.split(":")[1]) <= PlayerModel.ins.level)
            {
               this.check_needAuto.mouseEvent = false;
               _loc3_ = new TaskGetCurInfoReq();
               _loc3_.kinds = [3];
               ServerEngine.ins.send(8300,_loc3_,crtTasksInfoHandler);
            }
            else if(_loc4_ == null || int(_loc4_.condition.split(":")[1]) > PlayerModel.ins.level)
            {
               addFilter(img_bg,true);
               addFilter(check_needAuto,true);
               addFilter(txt_names,true);
               this.check_needAuto.mouseEvent = false;
               linkGoTo.visible = false;
               openTips.text = LocaleMgr.ins.getStr(999000752,[_loc4_.condition.split(":")[1]]);
               openTips.visible = true;
               openTips1.visible = false;
            }
            else
            {
               addFilter(img_bg,false);
               addFilter(check_needAuto,false);
               addFilter(txt_names,false);
               this.check_needAuto.mouseEvent = true;
               linkGoTo.visible = true;
               openTips.visible = false;
               if(funcId == 50500)
               {
                  openTips1.visible = true;
               }
               else
               {
                  openTips1.visible = false;
               }
            }
            checkBtnGoTo();
         }
         else
         {
            switchEventListeners(false);
         }
      }
      
      private function checkBtnGoTo() : void
      {
         if(ModuleMgr.ins.isShow(50507))
         {
            linkGoTo.visible = false;
         }
         else
         {
            linkGoTo.visible = true;
         }
      }
      
      private function crtTasksInfoHandler(param1:TaskGetCurInfoRes) : void
      {
         if(param1)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1.info;
            for each(var _loc2_ in param1.info)
            {
               if(_loc2_.id == 40001)
               {
                  if(_loc2_.status > 1)
                  {
                     AssistantModel.ins.battleFieldHasFirstWin = true;
                     addFilter(img_bg,false);
                     addFilter(check_needAuto,false);
                     addFilter(txt_names,false);
                     this.check_needAuto.mouseEvent = true;
                     linkGoTo.visible = true;
                     openTips.visible = false;
                     openTips1.visible = false;
                  }
                  else
                  {
                     addFilter(img_bg,true);
                     addFilter(check_needAuto,true);
                     addFilter(txt_names,true);
                     this.check_needAuto.mouseEvent = false;
                     linkGoTo.visible = true;
                     openTips.visible = false;
                     openTips1.visible = true;
                  }
               }
            }
         }
         checkBtnGoTo();
      }
      
      private function onGoToClickHandler(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(funcId,funcId == 41600?new NpcFuncListParam(108,null):null);
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.box_func.addEventListener("click",onBoxClick);
         }
         else
         {
            this.box_func.removeEventListener("click",onBoxClick);
         }
      }
      
      private function needAutoClick(param1:Boolean) : Boolean
      {
         if(param1 == this.check_needAuto.selected)
         {
            return true;
         }
         if(param1 == true)
         {
            if(AssistantModel.ins.canUseAssistant(this.funcId))
            {
               AssistantModel.ins.addNeedDoFunId(this.funcId);
               return true;
            }
            AlertUtil.lackLevel(AssistantModel.ins.getOpenLevel(this.funcId));
            return false;
         }
         if(AssistantModel.ins.isActing && AssistantModel.ins.isNeedAuto(this.funcId))
         {
            AlertUtil.float(LocaleMgr.ins.getStr(60200033));
            return false;
         }
         AssistantModel.ins.removeNeedDoFuncId(this.funcId);
         return true;
      }
      
      private function onBoxClick(param1:MouseEvent) : void
      {
         if(AssistantModel.ins.canUseAssistant(this.funcId))
         {
            if(this.funcId != 50500)
            {
               ObserverMgr.ins.sendNotice("showSettingPanel",this.funcId);
            }
            else if(this.funcId == 50500 && AssistantModel.ins.battleFieldHasFirstWin)
            {
               ObserverMgr.ins.sendNotice("showSettingPanel",this.funcId);
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(999000824));
            }
         }
         else
         {
            AlertUtil.lackLevel(AssistantModel.ins.getOpenLevel(this.funcId));
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
