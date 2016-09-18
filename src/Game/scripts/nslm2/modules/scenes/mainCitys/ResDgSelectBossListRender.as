package nslm2.modules.scenes.mainCitys
{
   import game.ui.mainCitys.ResDgSelectBossListRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcResourceStageVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.LabelUtils;
   import nslm2.common.model.HeroModel;
   
   public class ResDgSelectBossListRender extends ResDgSelectBossListRenderUI
   {
       
      
      public function ResDgSelectBossListRender()
      {
         super();
         this.buttonMode = true;
      }
      
      public function get vo() : StcResourceStageVo
      {
         return dataSource as StcResourceStageVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(vo)
         {
            _loc2_ = StcMgr.ins.getNpcVo(vo.bossid);
            this.img_icon.url = UrlLib.headIcon(_loc2_.head_id);
            this.txt_name.text = LocaleMgr.ins.getStr(vo.name);
            this.txt_des.text = LocaleMgr.ins.getStr(vo.des);
            this.txt_levelLimite.color = LabelUtils.getCountNeedColor(HeroModel.ins.playerHero.baseInfo.level,vo.level);
            this.txt_levelLimite.text = LocaleMgr.ins.getStr(999000517) + HeroModel.ins.playerHero.baseInfo.level + "/" + vo.level;
            this.img_lock.visible = HeroModel.ins.playerHero.baseInfo.level < vo.level;
         }
      }
   }
}
