package nslm2.modules.cultivates.skillChangePanels
{
   import game.ui.skillChangePanel.SkillKindRenderUI;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.HeroModel;
   import nslm2.mgrs.stcMgrs.vos.StcHeroShengjieVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.cultivates.horse.utils.HorseUtil;
   import nslm2.modules.cultivates.horse.HorseService;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import flash.events.MouseEvent;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.event.MzEvent;
   
   public class SkillKindRender extends SkillKindRenderUI
   {
       
      
      private var _skillKind:int;
      
      private var _redPoint:RedPoint;
      
      public function SkillKindRender()
      {
         _redPoint = new RedPoint();
         super();
         this.addEventListener("click",onClick);
         _redPoint.top = -2;
         _redPoint.right = -2;
         this.btn_change.addChild(_redPoint);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         _skillKind = param1 as int;
         var _loc3_:StcHeroShengjieVo = StcMgr.ins.getVoByMultiColumnValue("static_hero_shengjie",["kind","level"],[1,HeroModel.ins.playerHero.baseInfo.sjLevel]) as StcHeroShengjieVo;
         switch(int(_skillKind))
         {
            case 0:
               _redPoint.visible = SkillChangeModel.ins.newNorSkillVec.length > 0;
               _loc5_ = SkillChangeModel.ins.getUsingNorSkillId();
               _loc4_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc5_,_loc3_.skill_level]);
               .super.dataSource = _loc4_.id;
               break;
            case 1:
               _redPoint.visible = SkillChangeModel.ins.newSpeSkillVec.length > 0;
               _loc5_ = SkillChangeModel.ins.getUsingSpeSkillId();
               _loc4_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc5_,_loc3_.skill_level]);
               .super.dataSource = _loc4_.id;
               break;
            case 2:
               _redPoint.visible = SkillChangeModel.ins.newAuraVec.length > 0;
               _loc5_ = SkillChangeModel.ins.getUsingAuraId();
               _loc4_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc5_,HorseUtil.getRank(HorseService.ins.masterLevel)]);
               .super.dataSource = !!_loc4_?_loc4_.id:int(_loc5_);
               if(SkillChangeModel.ins.getUsingAuraId() == 0)
               {
                  if(FuncOpenAutoCtrl.checkOpen(30300) && SkillChangeModel.ins.getAuraList().length > 0)
                  {
                     this.btn_change.visible = true;
                     this.txt_desc.text = LocaleMgr.ins.getStr(30106009);
                  }
                  else if(FuncOpenAutoCtrl.checkOpen(30300) == false)
                  {
                     this.btn_change.visible = false;
                     this.txt_desc.text = FuncOpenAutoCtrl.getOpenLevelTipString(30300);
                  }
                  else
                  {
                     this.btn_change.visible = false;
                     this.txt_desc.text = LocaleMgr.ins.getStr(30300024);
                  }
               }
               this.txt_kind.text = LocaleMgr.ins.getStr(4300 + 4);
         }
         if(stcSkillId != 0)
         {
            _loc7_ = StcMgr.ins.getSkillVo(stcSkillId);
            _loc2_ = "[" + LocaleMgr.ins.getStr(_loc7_.name) + " Lv." + _loc7_.level + "]";
            _loc6_ = TextFieldUtil.htmlText(_loc2_,new TextFormat(null,null,16745472));
            this.txt_desc.isHtml = true;
            this.txt_desc.text = _loc6_ + LocaleMgr.ins.getStr(_loc7_.skill_description1);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         DisplayUtils.removeSelf(_redPoint);
         this.dispatchEvent(new MzEvent("evtSkillChangeClick",_skillKind,true));
      }
   }
}
