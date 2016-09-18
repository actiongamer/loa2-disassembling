package nslm2.modules.Chapters.maps
{
   import game.ui.chapters.maps.MapArrowUI;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.common.model.HeroModel;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class MapArrow extends MapArrowUI
   {
       
      
      public function MapArrow()
      {
         super();
         this.img_roleHeader.mask = this.headerMask;
         if(EnvConfig.ins.useServer)
         {
            this.img_roleHeader.url = HeroInfoUtil.getHeadIconUrlByHeroBaseInfo(HeroModel.ins.playerHero.baseInfo);
         }
         this.parts.push(new FloatUpDownEffCtrl().init(this.boxAll));
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
