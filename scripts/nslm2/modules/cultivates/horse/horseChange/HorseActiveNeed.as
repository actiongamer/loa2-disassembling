package nslm2.modules.cultivates.horse.horseChange
{
   import game.ui.horseModules.horseChange.HorseActiveNeedUI;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.modules.cultivates.horse.HorseService;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.cultivates.horse.utils.HorseUtil;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.common.ctrls.TSM;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import morn.core.utils.StringUtils;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.LabelUtils;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.configs.ClientConfig;
   
   public class HorseActiveNeed extends HorseActiveNeedUI
   {
       
      
      public var tsms:TSMDict;
      
      private var _nowChoosedId:int;
      
      public function HorseActiveNeed()
      {
         super();
         this.renderPre.img_icon.buttonMode = true;
         this.renderMaster.img_icon.skin = UrlLib.horseUrl(0);
         this.renderMaster.img_icon.buttonMode = true;
         switchEventListeners(true);
         this.render_horseSkill.needShowValidBg = true;
         this.renderCost.img_icon.buttonMode = true;
         if(ClientConfig.isRuLang())
         {
            this.renderCost.txt_name.size = 10;
            this.renderCost.txt_name.width = 80;
         }
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            HorseService.ins.addEventListener("evtAuraUsingChange",onSkillUsingChange);
         }
         else
         {
            HorseService.ins.removeEventListener("evtAuraUsingChange",onSkillUsingChange);
         }
      }
      
      private function onSkillUsingChange(param1:MzEvent) : void
      {
         var _loc2_:* = null;
         if(HorseService.ins.activatedAuraList.length == 0)
         {
            this.render_horseSkill.stcSkillId = 0;
            this.render_horseSkill.toolTip = LocaleMgr.ins.getStr(30300024);
         }
         else
         {
            _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[HorseService.ins.curAuraId,HorseUtil.getRank(HorseService.ins.masterLevel)]);
            this.render_horseSkill.dataSource = !!_loc2_?_loc2_.id:0;
         }
      }
      
      public function show(param1:int) : void
      {
         var _loc2_:* = NaN;
         var _loc4_:* = null;
         this._nowChoosedId = param1;
         if(tsms == null)
         {
            _loc2_ = 0.3;
            tsms = new TSMDict();
            tsms.put(this.btn0,new TSM(this.btn0,_loc2_).addState(1,{"y":this.btn0.y - 50}).copyState(2,0).copyState(3,0).copyState(4,0).copyState(5,0));
            tsms.put(this,new TSM(this.box_cond,_loc2_).addState(1,{
               "alpha":0,
               "y":this.y + 20
            }).copyState(2,0).copyState(3,0).copyState(4,0).copyState(5,0));
            tsms.put(this.renderPre,new TSM(this.renderPre,_loc2_).copyState(1,0).copyState(2,0).addState(3,{"alpha":0}).copyState(4,0).copyState(5,3));
            tsms.put(this.renderMaster,new TSM(this.renderMaster,_loc2_).copyState(1,0).copyState(2,0).addState(3,{"x":109}).addState(4,{"x":280}).addState(5,{"x":187}));
            tsms.put(this.renderCost,new TSM(this.renderCost,_loc2_).copyState(1,0).copyState(2,0).addState(3,{"x":280}).addState(4,{"alpha":0}).copyState(5,4));
         }
         if(HorseService.ins.activatedAuraList.length == 0)
         {
            this.render_horseSkill.stcSkillId = 0;
            this.render_horseSkill.toolTip = LocaleMgr.ins.getStr(30300024);
         }
         else
         {
            _loc4_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[HorseService.ins.curAuraId,HorseUtil.getRank(HorseService.ins.masterLevel)]);
            this.render_horseSkill.dataSource = !!_loc4_?_loc4_.id:0;
         }
         var _loc5_:int = HorseService.ins.getState(param1);
         var _loc3_:StcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(param1);
         switch(int(_loc5_) - 1)
         {
            case 0:
               this.btn0.labelMargin = "0";
               tsms.toState(1,NaN,null,checkNg);
               this.btn0.label = LocaleMgr.ins.getStr(30300011);
               break;
            case 1:
               this.btn0.labelMargin = "0";
               this.btn0.label = LocaleMgr.ins.getStr(30300012);
               tsms.toState(1,NaN,null,checkNg);
               break;
            default:
               if(_loc3_.prev > 0)
               {
                  this.renderPre.stcSaddlehorseId = _loc3_.prev;
                  if(StringUtils.isNull(_loc3_.item) != null)
                  {
                     tsms.toState(2,NaN,null,checkNg);
                  }
                  else
                  {
                     tsms.toState(4,NaN,null,checkNg);
                  }
               }
               else if(StringUtils.isNull(_loc3_.item))
               {
                  tsms.toState(5,NaN,null,checkNg);
               }
               else
               {
                  tsms.toState(3,NaN,null,checkNg);
               }
               this.renderMaster.txt_name.text = LocaleMgr.ins.getStr(30300041) + LocaleMgr.ins.getStr(999000044,[TextFieldUtil.htmlText2(_loc3_.rank,LabelUtils.getCountNeedColor(HorseUtil.getRank(HorseService.ins.masterLevel),_loc3_.rank))]);
               this.renderMaster.txt_countAndNeed.text = LabelUtils.countNeedStr(HorseUtil.getRank(HorseService.ins.masterLevel),_loc3_.rank);
         }
      }
      
      public function checkNg() : void
      {
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
