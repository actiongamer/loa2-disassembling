package nslm2.modules.funnies.pkCrossSer
{
   import game.ui.pkCrossSer.PKCrossEntryUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.utils.RTools;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class PKCrossEntry extends PKCrossEntryUI
   {
       
      
      private var textCDCtrl_reward:TextCDCtrlS2;
      
      private var textCDCtrl_reward2:TextCDCtrlS2;
      
      public function PKCrossEntry()
      {
         super();
         this.img_bg.url = UrlLib.pkCrossSerUrl("entry_bg.png");
         textCDCtrl_reward = new TextCDCtrlS2(this.txt_countdown,textCDFormat,txtCDCtrl_start_cpl);
         this.parts.push(textCDCtrl_reward);
         textCDCtrl_reward2 = new TextCDCtrlS2(this.txt_countdown,textCDFormat2,txtCDCtrl_start_cpl2);
         this.parts.push(textCDCtrl_reward2);
      }
      
      public function startRewardCD(param1:uint) : void
      {
         textCDCtrl_reward2.start(param1);
      }
      
      private function textCDFormat2(param1:int) : String
      {
         return LocaleMgr.ins.getStr(50600051,[TextFieldUtil.htmlText2(TimeUtils.hisColonFullAddZero(param1),LabelUtils.cdColor(false))]);
      }
      
      private function txtCDCtrl_start_cpl2() : void
      {
         txt_countdown.text = LocaleMgr.ins.getStr(50600002);
      }
      
      public function setDate(param1:uint) : void
      {
         var _loc11_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc9_:int = 0;
         var _loc5_:* = 0;
         var _loc3_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = null;
         var _loc4_:* = null;
         var _loc10_:int = StcMgr.ins.getFunctionVo(50600).level;
         if(param1 <= 0)
         {
            _loc2_ = LocaleMgr.ins.getStr(300006062);
            _loc11_ = LocaleMgr.ins.getStr(300006062);
         }
         else
         {
            _loc6_ = DefindConsts.CROSS_ARENA_MASS_DAY;
            _loc9_ = DefindConsts.CROSS_ARENA_FINAL_DAY;
            _loc5_ = uint(param1 + (_loc6_ - 1) * 24 * 3600);
            _loc3_ = uint(param1 + _loc6_ * 24 * 3600);
            _loc7_ = uint(param1 + (_loc6_ - 1 + _loc9_) * 24 * 3600);
            _loc11_ = TimeUtils.getFullTimeStrCN(param1,true,true,RTools.cl(false,true)).split(" ")[0] + "-" + TimeUtils.getFullTimeStrCN(_loc5_,true,true,RTools.cl(false,true)).split(" ")[0];
            _loc2_ = TimeUtils.getFullTimeStrCN(_loc3_,true,true,RTools.cl(false,true)).split(" ")[0] + "-" + TimeUtils.getFullTimeStrCN(_loc7_,true,true,RTools.cl(false,true)).split(" ")[0];
            _loc8_ = String(DefindConsts.CROSS_ARENA_TIME_INTVL).split("|");
            _loc4_ = "，" + LocaleMgr.ins.getStr(50500102) + _loc8_[0] + ":00-" + _loc8_[1] + ":00";
            _loc11_ = _loc11_ + _loc4_;
            _loc2_ = _loc2_ + _loc4_;
         }
         this.txt_info.text = LocaleMgr.ins.getStr(50600009,[_loc10_,_loc11_,_loc2_,_loc10_,_loc10_]);
      }
      
      public function breakTime() : void
      {
         var _loc2_:Array = String(DefindConsts.CROSS_ARENA_TIME_INTVL).split("|");
         var _loc1_:String = LocaleMgr.ins.getStr(50500102) + _loc2_[0] + ":00-" + _loc2_[1] + ":00";
         txt_countdown.text = LocaleMgr.ins.getStr(50600046) + _loc1_;
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(50600047,[TextFieldUtil.htmlText2(TimeUtils.hisColonFullAddZero(param1),LabelUtils.cdColor(false))]);
      }
      
      private function txtCDCtrl_start_cpl() : void
      {
         ObserverMgr.ins.sendNotice("OPT_START_CD_COMPLETE");
      }
      
      public function startCD(param1:uint) : void
      {
         param1 = param1 + 3;
         textCDCtrl_reward.start(param1);
      }
   }
}
