package nslm2.modules.funnies.families.familyBosses.view.render
{
   import game.ui.familyBosses.render.FamilyBossRewardShowRenderUI;
   import nslm2.modules.funnies.families.familyBosses.vo.DamageRewardVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class DamageRewardShowListRender extends FamilyBossRewardShowRenderUI
   {
       
      
      private var _vo:DamageRewardVo;
      
      public function DamageRewardShowListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _vo = param1 as DamageRewardVo;
         img_got.visible = false;
         img_hasGot.visible = false;
         if(_vo)
         {
            updateStatus();
            rwdRender.dataSource = _vo.reward[0];
            txt_condition.text = LocaleMgr.ins.getStr(40740061,[LocaleConsts.getNumberAbbr2(_vo.needDmg + "")]);
            txt_progress.color = _vo.crtDmg >= _vo.needDmg?458496:16723968;
            txt_progress.text = _vo.crtDmg + "/" + _vo.needDmg;
         }
      }
      
      private function updateStatus() : void
      {
         switch(int(_vo.status))
         {
            case 0:
               break;
            case 1:
               img_got.visible = true;
               break;
            case 2:
               img_hasGot.visible = true;
         }
      }
   }
}
