package nslm2.modules.battles.guildDungeons
{
   import game.ui.guildDungeon.GuildMapContentPanelUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyStageChapterVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncVo;
   import nslm2.utils.LabelUtils;
   import nslm2.utils.TimeUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.utils.DisplayUtils;
   
   public class GuildMapContentPanel extends GuildMapContentPanelUI implements IObserver
   {
       
      
      private var _chapterId:int;
      
      private var _textCdCtrl:TextCDCtrlS2;
      
      public function GuildMapContentPanel()
      {
         super();
         ObserverMgr.ins.regObserver(this);
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         DisplayUtils.addChildFromGlobal(btn_rank,txt_rank);
         DisplayUtils.addChildFromGlobal(btn_select,txt_select);
      }
      
      public function init() : void
      {
         this.list_map.dataSource = [StcMgr.ins.getFamilyStageChapterVo(GuildDungeonModel.ins.todayChapterId)];
         this._textCdCtrl = new TextCDCtrlS2(this.txt_resetTime,textCDFormat,null);
         var _loc1_:StcFamilyStageChapterVo = StcMgr.ins.getFamilyStageChapterVo(GuildDungeonModel.ins.todayChapterId);
         this.txt_title.text = LocaleMgr.ins.getStr(_loc1_.name);
         if(this._textCdCtrl)
         {
            this._textCdCtrl.start(GuildDungeonModel.ins.nextResetTime);
         }
         setTimes();
         setNowBuff();
      }
      
      public function getFocusNotices() : Array
      {
         return ["evtNodeInfoChanged","MSG_NPC_FUNC_VO_CHANGE"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("evtNodeInfoChanged" !== _loc3_)
         {
            if("MSG_NPC_FUNC_VO_CHANGE" === _loc3_)
            {
               setTimes();
            }
         }
         else
         {
            setNowBuff();
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_rank !== _loc2_)
         {
            if(this.btn_select !== _loc2_)
            {
               if(this.btn_buyTimes === _loc2_)
               {
                  AlertUtil.comfirm(LocaleMgr.ins.getStr(50200012,[TimePriceUtil.curTimePriceVo(3).count]) + "\n" + LocaleMgr.ins.getStr(50200107,[TimePriceUtil.curTimes(3),int(VipModel.ins.getVipValue(10610))]),doBuyTimes,null,null,null,null,0,false,10610);
               }
            }
            else
            {
               ModuleMgr.ins.showModule(40722,null,40720);
            }
         }
         else
         {
            ModuleMgr.ins.showModule(50231,[2,Uint64Util.indexByAttr(GuildDungeonModel.ins.damageRankArr,"playerid",PlayerModel.ins.playerInfo.id) + 1],ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function doBuyTimes() : void
      {
         TimePriceUtil.buyTimes(3,1,addTimes,10610);
      }
      
      private function addTimes() : void
      {
         NpcFuncService.ins.countPlusOne(40720);
         AlertUtil.float(LocaleMgr.ins.getStr(999000030));
         setTimes();
      }
      
      private function setTimes() : void
      {
         var _loc1_:NpcFuncVo = NpcFuncService.ins.getVo(40720);
         if(_loc1_)
         {
            this.txt_leftTimes.text = LocaleMgr.ins.getStr(40710103) + LabelUtils.leaveMaxStr(_loc1_.count,int(VipModel.ins.getVipValue(10600)));
         }
      }
      
      private function setNowBuff() : void
      {
         this.list_buff.dataSource = GuildDungeonModel.ins.allBuffArr();
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(999000031,[TimeUtils.hisColonFullAddZero(param1),LocaleMgr.ins.getStr(StcMgr.ins.getFamilyStageChapterVo(GuildDungeonModel.ins.getTomorrowTargetId()).name)]);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
