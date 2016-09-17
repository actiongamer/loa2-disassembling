package nslm2.modules.cultivates.skillChangePanels
{
   import game.ui.skillChangePanel.SkillChangeRenderUI;
   import nslm2.modules.cultivates.horse.HorseService;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.cultivates.horse.utils.HorseUtil;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.common.model.HeroModel;
   import nslm2.mgrs.stcMgrs.vos.StcHeroShengjieVo;
   import flash.events.MouseEvent;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.cultivates.fashion.FashionEffectVO;
   import nslm2.modules.cultivates.fashion.FashionModel;
   
   public class SkillChangeRender extends SkillChangeRenderUI
   {
       
      
      public function SkillChangeRender()
      {
         super();
         this.skillRender.addEventListener("click",onSkillClick);
         FashionModel.ins.addEventListener("evtSkillUsingChange",onSkillUsingChange);
         HorseService.ins.addEventListener("evtAuraUsingChange",onSkillUsingChange);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         .super.dataSource = param1;
         this.skillRender.needShowValidBg = true;
         if(HorseService.ins.allAuraList.indexOf(param1 as int) != -1)
         {
            _loc4_ = param1 as int;
            _loc3_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc4_,HorseUtil.getRank(HorseService.ins.masterLevel)]);
            this.skillRender.dataSource = !!_loc3_?_loc3_.id:int(param1 as int);
         }
         else
         {
            _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_hero_shengjie",["kind","level"],[1,HeroModel.ins.playerHero.baseInfo.sjLevel]) as StcHeroShengjieVo;
            _loc4_ = param1 as int;
            _loc3_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc4_,_loc2_.skill_level]);
            this.skillRender.dataSource = !!_loc3_?_loc3_.id:int(param1 as int);
         }
         if(param1 != 0)
         {
            this.img_new.visible = SkillChangeModel.ins.isNew(this.dataSource as int);
            this.txt_using.visible = SkillChangeModel.ins.isUsing(this.dataSource as int);
            this.mouseEvent = true;
         }
         else
         {
            this.img_new.visible = false;
            this.txt_using.visible = false;
            this.mouseEvent = false;
         }
      }
      
      private function onSkillClick(param1:MouseEvent) : void
      {
         if(!(int(StcMgr.ins.getSkillVo(this.dataSource as int).kind) - 1))
         {
            this.dispatchEvent(new MzEvent("evtSpeSkillSelect",new FashionEffectVO(this.skillRender.img_icon,this.dataSource as int),true));
         }
         else if(HorseService.ins.allAuraList.indexOf(this.dataSource as int) != -1)
         {
            this.dispatchEvent(new MzEvent("evtAuraSkillSelect",new FashionEffectVO(this.skillRender.img_icon,this.dataSource as int),true));
         }
         else
         {
            this.dispatchEvent(new MzEvent("evtNorSkillSelect",new FashionEffectVO(this.skillRender.img_icon,this.dataSource as int),true));
         }
      }
      
      private function onSkillUsingChange(param1:MzEvent) : void
      {
         this.txt_using.visible = SkillChangeModel.ins.isUsing(this.dataSource as int);
      }
      
      override public function dispose() : void
      {
         this.skillRender.removeEventListener("click",onSkillClick);
         super.dispose();
      }
   }
}
