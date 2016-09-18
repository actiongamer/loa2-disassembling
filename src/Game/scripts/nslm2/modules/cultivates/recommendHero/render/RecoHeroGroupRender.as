package nslm2.modules.cultivates.recommendHero.render
{
   import game.ui.recommendHero.render.RecoHeroGroupRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcRecommendHeroVo;
   import nslm2.modules.cultivates.recommendHero.RecommendHeroModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class RecoHeroGroupRender extends RecoHeroGroupRenderUI
   {
       
      
      public function RecoHeroGroupRender()
      {
         super();
      }
      
      private function get vo() : StcRecommendHeroVo
      {
         return this.dataSource as StcRecommendHeroVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.list_teamHero.dataSource = RecommendHeroModel.ins.getRecommendTeamArr(this.vo);
            this.list_yuanjun.dataSource = RecommendHeroModel.ins.getRecommendYuanjunArr(this.vo);
            this.txt_name.text = LocaleMgr.ins.getStr(vo.name);
            this.txt_desc.text = LocaleMgr.ins.getStr(vo.desc);
            if(App.language == "en")
            {
               txt_desc.indent = 0;
            }
            this.txt_totalYuanfenCnt.num = RecommendHeroModel.ins.getTotalYuanfenCount(this.vo);
         }
      }
   }
}
