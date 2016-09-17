package nslm2.modules.funnies.guildPKCrossSer.quest
{
   import game.ui.guildPKCrossSer.GPKQuestPanelUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.funnies.guildPKCrossSer.GPKConst;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.funnies.guildPKCrossSer.GPKCModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.utils.WealthUtil;
   
   public class GPKQuestPanel extends GPKQuestPanelUI
   {
       
      
      private var textCD:TextCDCtrlS2;
      
      private var receTask:Boolean = false;
      
      public function GPKQuestPanel()
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc1_:int = 0;
         super();
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(30610218);
         this.img_bg.skin = UrlLib.gpkcUrl("img_quest_bg.png");
         this.title_0.text = LocaleMgr.ins.getStr(30610219);
         this.title_1.text = LocaleMgr.ins.getStr(30610220);
         this.title_2.text = LocaleMgr.ins.getStr(30610221);
         this.btn_get.label = LocaleMgr.ins.getStr(30610222);
         this.txt_cd.text = "";
         txt_2.text = "";
         powerTxt.text = LocaleMgr.ins.getStr(999900116);
         btn_get.clickHandler = getClick;
         if(model.taskInfo)
         {
            _loc3_ = model.taskInfo.desc.split("|");
            this.txt_0.text = LocaleMgr.ins.getStr(_loc3_[0]);
            _loc2_ = LocaleMgr.ins.getStr(_loc3_[1]);
            _loc1_ = model.getTaskTotalNum();
            if(_loc1_ > 0)
            {
               _loc2_ = _loc2_ + (" (" + model.curTask.taskFinishNum + "/" + _loc1_ + ")");
            }
            this.txt_1.text = _loc2_;
            this.list_item.dataSource = WealthUtil.costStrToArr(model.taskInfo.reward);
            this.img_diff.visible = false;
            updateUI();
         }
      }
      
      private function updateUI() : void
      {
         if(model.curTask.taskState == GPKConst.task_no_comp)
         {
            if(model.curTask.endStamp > 0)
            {
               starCD(model.curTask.endStamp);
            }
         }
         this.img_st.visible = model.curTask.taskState == GPKConst.task_comp;
         btn_get.disabled = model.curTask.taskState != GPKConst.task_no_get;
      }
      
      private function getClick() : void
      {
         if(GuildModel.ins.isPresident() || GuildModel.ins.isVP())
         {
            receTask = true;
            ServerEngine.ins.send(4361);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30610223));
         }
      }
      
      private function starCD(param1:uint) : void
      {
         if(textCD)
         {
            textCD.dispose();
         }
         param1 = param1 + 3;
         textCD = new TextCDCtrlS2(this.txt_cd,textCDFormat,txtCDCtrl_cpl);
         textCD.start(param1);
      }
      
      private function textCDFormat(param1:uint) : String
      {
         return LocaleMgr.ins.getStr(13323003) + TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1));
      }
      
      private function txtCDCtrl_cpl() : void
      {
      }
      
      override public function getFocusNotices() : Array
      {
         return ["GPK_OPT_REFRESH_TASK_PANEL"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("GPK_OPT_REFRESH_TASK_PANEL" === _loc3_)
         {
            if(receTask)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(50700022));
               receTask = false;
            }
            updateUI();
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(textCD)
         {
            textCD.dispose();
         }
      }
      
      private function get model() : GPKCModel
      {
         return GPKCModel.ins;
      }
   }
}
