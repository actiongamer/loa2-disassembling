package nslm2.modules.Chapters
{
   import nslm2.modules.Chapters.treasureBox.TreasureBoxCtrlBase;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.utils.WealthUtil;
   import flash.events.MouseEvent;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.StageOpenBoxReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import proto.ProtocolStatusRes;
   import nslm2.common.ui.components.comps2d.others.TreasureBoxBaseRender;
   
   public class DungeonTreasureCtrl extends TreasureBoxCtrlBase
   {
       
      
      private var _stageId:int;
      
      public var state:int;
      
      public function DungeonTreasureCtrl(param1:TreasureBoxBaseRender, param2:* = null)
      {
         super(param1,param2);
      }
      
      public function setStageId(param1:int) : DungeonTreasureCtrl
      {
         this._stageId = param1;
         var _loc4_:Array = getItemArr();
         state = getState();
         var _loc2_:TreasureBoxVo = new TreasureBoxVo(_loc4_,state);
         var _loc3_:StcStageVo = StcMgr.ins.getStageVo(this._stageId);
         _loc2_.optionData = LocaleMgr.ins.getStr(40400025,[TextFieldUtil.htmlText(LocaleMgr.ins.getStr(_loc3_.name),new TextFormat(null,null,458496))]);
         this.box.toolTip = LocaleMgr.ins.getStr(40400028) + "\r\n" + _loc2_.optionData;
         this.vo = _loc2_;
         return this;
      }
      
      private function getItemArr() : Array
      {
         var _loc1_:StcStageVo = StcMgr.ins.getStageVo(this._stageId);
         return WealthUtil.dropGroupIDToWealthVoArr(_loc1_.box_prize);
      }
      
      private function getState() : int
      {
         if(ChapterModel.ins.cplIdArr.indexOf(this._stageId) != -1)
         {
            if(ChapterModel.ins.getOpenBoxInfo(this._stageId) == true)
            {
               return 3;
            }
            return 2;
         }
         return 1;
      }
      
      override protected function onBoxClick(param1:MouseEvent) : void
      {
         var _loc2_:TreasureBoxModuleVo = new TreasureBoxModuleVo(this.vo,moduleCloseHandler,rewardHandler,40400);
         if(!(int(_loc2_.data.state) - 2))
         {
            Handler.execute(rewardHandler1,[_loc2_]);
         }
         else
         {
            ModuleMgr.ins.showModule(40401,_loc2_,40400);
         }
         super.onBoxClick(param1);
      }
      
      private function rewardHandler1(param1:TreasureBoxModuleVo) : void
      {
         var _loc2_:StageOpenBoxReq = new StageOpenBoxReq();
         _loc2_.stageId = this._stageId;
         ServerEngine.ins.send(8061,_loc2_,serverCplHandler_stageOpenBox);
         FloatUtil.showGetItemsDisplayPanel(param1.data.itemArr,null,null,param1.parentModuleId);
      }
      
      override protected function rewardHandler() : void
      {
         var _loc1_:StageOpenBoxReq = new StageOpenBoxReq();
         _loc1_.stageId = this._stageId;
         ServerEngine.ins.send(8061,_loc1_,serverCplHandler_stageOpenBox);
      }
      
      private function serverCplHandler_stageOpenBox(param1:ProtocolStatusRes) : void
      {
         (this.vo as TreasureBoxVo).state = 3;
         this.moduleCloseState = 3;
         ChapterModel.ins.setOpenBoxInfo(this._stageId,true);
         refreshBox();
         refreshModule();
      }
   }
}
