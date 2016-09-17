package nslm2.modules.battles.battlefields.scene
{
   import game.ui.battlefield.BattlefieldScene.panel.BattlefieldSceneTopPanelUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.mgrs.stcMgrs.vos.StcBginfoVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.common.vo.BuffHasLayersVo;
   import morn.customs.expands.MornExpandUtil;
   
   public class BattlefieldSceneTopPanel extends BattlefieldSceneTopPanelUI
   {
       
      
      private var _textCdCtrl:TextCDCtrlS2;
      
      private var _blueNum:int;
      
      private var _redNum:int;
      
      public function BattlefieldSceneTopPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         var _loc1_:Boolean = false;
         buff1.visible = _loc1_;
         buff1.visible = _loc1_;
      }
      
      public function show(param1:Object) : void
      {
         var _loc3_:StcBginfoVo = StcMgr.ins.getBginfoVo(BattlefieldModel.ins.curBattlefieldId);
         var _loc4_:* = PlayerModel.ins.playerInfo.name;
         myNameRightTxt.text = _loc4_;
         myNameLeftTxt.text = _loc4_;
         if(BattlefieldModel.ins.currentBgStagePlayerInfo.side == 1)
         {
            this.myNameLeftTxt.visible = true;
            this.myNameRightTxt.visible = false;
         }
         else
         {
            this.myNameLeftTxt.visible = false;
            this.myNameRightTxt.visible = true;
         }
         var _loc6_:int = 0;
         var _loc5_:* = param1.teamInfos;
         for each(var _loc2_ in param1.teamInfos)
         {
            _loc4_ = _loc2_.side;
            if(1 !== _loc4_)
            {
               if(2 === _loc4_)
               {
                  this.txt_redScore.text = _loc2_.resNum + "/" + _loc3_.bg_vict_num;
                  if(_loc2_.resNum > _redNum)
                  {
                     AlertUtil.float("+" + (int(_loc2_.resNum - _redNum)),DisplayUtils.globarCenter(this.txt_redScore));
                  }
                  _redNum = _loc2_.resNum;
                  this.txt_redTeamNum.text = _loc2_.playerNum + "/" + _loc3_.bg_player_num;
                  this.txt_redKill.text = LocaleMgr.ins.getStr(50500116,[_loc2_.killNum]);
               }
            }
            else
            {
               this.txt_blueScore.text = _loc2_.resNum + "/" + _loc3_.bg_vict_num;
               if(_loc2_.resNum > _blueNum)
               {
                  AlertUtil.float("+" + (int(_loc2_.resNum - _blueNum)),DisplayUtils.globarCenter(this.txt_blueScore));
               }
               _blueNum = _loc2_.resNum;
               this.txt_blueTeamNum.text = _loc2_.playerNum + "/" + _loc3_.bg_player_num;
               this.txt_blueKill.text = LocaleMgr.ins.getStr(50500116,[_loc2_.killNum]);
            }
         }
         if(_textCdCtrl == null)
         {
            _loc4_ = new TextCDCtrlS2(this.txt_leftTime,textCDFormat,null);
            this._textCdCtrl = _loc4_;
            this.parts.push(_loc4_);
            _textCdCtrl.start(param1.startStamp + _loc3_.bg_max_time * 60 + int(DefindConsts.BG_WAITING_TIME));
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_info === _loc2_)
         {
            ModuleMgr.ins.showOrCloseModule(50508,null,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(50500100) + ":" + TimeUtils.hisColonAddZero2(param1);
      }
      
      public function updateBuff(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = (DefindConsts.BG_FIRE_KILL_NPC_BUFFS as String).split("|")[0];
         var _loc5_:StcBuffVo = StcMgr.ins.getBuffVo(_loc4_);
         param1 = param1 > _loc5_.max_layer?_loc5_.max_layer:int(param1);
         param2 = param2 > _loc5_.max_layer?_loc5_.max_layer:int(param2);
         if(param1)
         {
            buff1.visible = true;
            buff1.dataSource = new BuffHasLayersVo(_loc4_,param1);
            buff1.toolTip = LocaleMgr.ins.getStr(50500177,[param1,(Number(param1 * _loc5_.init_effect_value1 * 100)).toFixed(1)]);
         }
         else
         {
            buff1.visible = false;
         }
         if(param2)
         {
            buff2.visible = true;
            buff2.dataSource = new BuffHasLayersVo(_loc4_,param2);
            buff2.toolTip = LocaleMgr.ins.getStr(50500177,[param2,(Number(param2 * _loc5_.init_effect_value1 * 100)).toFixed(1)]);
         }
         else
         {
            buff2.visible = false;
         }
      }
   }
}
