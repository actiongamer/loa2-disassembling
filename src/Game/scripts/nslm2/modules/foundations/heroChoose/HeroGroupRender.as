package nslm2.modules.foundations.heroChoose
{
   import game.ui.heroChooseModules.HeroGroupRenderUI;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class HeroGroupRender extends HeroGroupRenderUI
   {
       
      
      public function HeroGroupRender()
      {
         super();
         this.addEventListener("click",onMouseClicked);
      }
      
      private function get vo() : HeroGroupVo
      {
         return this.dataSource as HeroGroupVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            if(vo.hasChooseHero())
            {
               this.img_disable.visible = false;
               this.mouseEvent = true;
            }
            else
            {
               this.img_disable.visible = true;
               this.mouseEvent = false;
            }
            this.img_bg.skin = SkinLib.getGroupBg(vo.group);
            this.img_icon.skin = UrlLib.npcGroupImg(vo.group);
            this.txt_title.text = LocaleMgr.ins.getStr(5100 + vo.group);
         }
      }
      
      private function onMouseClicked(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("chooseHero",vo);
      }
   }
}
