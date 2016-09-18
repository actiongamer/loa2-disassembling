package nslm2.modules.cultivates.lotteryHeroModules.kindPanels
{
   import game.ui.lotteryHeroModules.kindPanels.LHKindPanelUI;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardProgressBox;
   import nslm2.common.ui.components.comps2d.HorseLampVMultiLine;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.LotteryInfoRes;
   import nslm2.modules.cultivates.lotteryHeroModules.LHModel;
   import proto.LotteryListData;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.common.ctrls.TSM;
   
   public class LHKindPanel extends LHKindPanelUI
   {
       
      
      private var tsms:TSMDict;
      
      private var horseLamp:HorseLampVMultiLine;
      
      private var state:int;
      
      public function LHKindPanel()
      {
         tsms = new TSMDict();
         super();
         txtCDCtrl_cpl();
         horseLamp = new HorseLampVMultiLine("left");
         this.txt_prompt_place.replaceWith(horseLamp);
         tsms.put(getRewardProgressBox,new TSM(this.getRewardProgressBox,0.4).addState(1,{}).addState(4,{
            "visible":false,
            "alpha":0
         }).copyState(11,4).copyState(12,1));
         tsms.put(box_discount,new TSM(this.box_discount,0.3).addState(1,{}).addState(4,{
            "visible":false,
            "alpha":0
         }).copyState(11,4).copyState(12,1));
         tsms.put(normalKind,new TSM(this.normalKind,0.4).addState(1,{}).addState(4,{"centerX":-1000}).copyState(11,4).copyState(12,4));
         tsms.put(advanKind,new TSM(this.advanKind,0.4).addState(1,{}).addState(4,{"centerX":1000}).copyState(11,4).copyState(12,4));
         tsms.put(horseLamp,new TSM(this.horseLamp,0.3).addState(1,{}).addState(4,{"centerY":500}).copyState(11,4).copyState(12,4));
         switchState(4,0);
      }
      
      private function get getRewardProgressBox() : GetRewardProgressBox
      {
         return this.getRewardProgressBoxUI as GetRewardProgressBox;
      }
      
      public function get normalKind() : LHKindNormal
      {
         return this.renderKindNormal as LHKindNormal;
      }
      
      public function get advanKind() : LHKindAdvan
      {
         return this.renderKindAdvan as LHKindAdvan;
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(11900046,[TimeUtils.hisColonFullAddZero(param1)]);
      }
      
      private function txtCDCtrl_cpl() : void
      {
         this.box_discount.setVisibleList("FUNC_COMMON",false);
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         ObserverMgr.ins.sendNotice("msg_lottery_hero_close");
      }
      
      public function init(param1:LotteryInfoRes) : void
      {
         LHModel.ins.panelInfo.point = param1.point;
         this.getRewardProgressBox.refreshMagicPoint();
         this.txt_discount1.text = LocaleMgr.ins.getStr(11900025);
         this.clip_discount.value = LHModel.ins.discount;
         this.txt_discount2.text = LocaleMgr.ins.getStr(999000065);
         this.box_discountH.refresh();
         this.box_discountH.centerX = 0;
         this.normalKind.parse(param1);
         this.advanKind.parse(param1);
         initHorseLamp(param1);
      }
      
      public function parse(param1:LotteryInfoRes) : void
      {
         LHModel.ins.panelInfo.point = param1.point;
         this.normalKind.parse(param1);
         this.advanKind.parse(param1);
      }
      
      public function floatMagicPoint() : void
      {
         this.getRewardProgressBox.refreshMagicPoint(true);
      }
      
      private function initHorseLamp(param1:LotteryInfoRes) : void
      {
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc4_:Array = [];
         var _loc3_:Array = param1.listdata;
         var _loc5_:int = _loc3_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc2_ = _loc3_[_loc7_];
            _loc6_ = StcMgr.ins.getNpcVo(_loc2_.id);
            if(_loc6_)
            {
               _loc4_.push(LocaleMgr.ins.getStr(999000067,[LinkUtils.playerName(_loc2_.playerId,_loc2_.name,0,13198693),TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000066),4827135),LinkUtils.stcNpcName(_loc2_.id)]));
            }
            else
            {
               _loc4_.push(LocaleMgr.ins.getStr(999000068) + _loc2_.id);
            }
            _loc7_++;
         }
         horseLamp.clear();
         horseLamp.init(Math.min(4,_loc5_));
         horseLamp.show(_loc4_);
      }
      
      public function switchState(param1:int, param2:Number = NaN) : void
      {
         state = param1;
         var _loc3_:* = param1;
         if(4 !== _loc3_)
         {
            if(1 !== _loc3_)
            {
               if(11 !== _loc3_)
               {
                  if(12 !== _loc3_)
                  {
                     if(32 !== _loc3_)
                     {
                        if(33 === _loc3_)
                        {
                           this.tsms.toState(4,param2,null,tsm_cpl);
                        }
                     }
                     else
                     {
                        this.tsms.toState(4,param2,null,tsm_cpl);
                     }
                  }
                  else
                  {
                     this.tsms.toState(4,param2,null,tsm_cpl);
                  }
               }
               else
               {
                  this.tsms.toState(4,param2,null,tsm_cpl);
               }
            }
            else
            {
               this.tsms.toState(1,param2,null,tsm_cpl);
            }
         }
         else
         {
            this.tsms.toState(4,param2,null,tsm_cpl);
         }
      }
      
      private function tsm_cpl() : void
      {
         if(!(state == 33 || state == 32))
         {
            NGUtil.checkModuleShow(11900,null);
         }
      }
   }
}
