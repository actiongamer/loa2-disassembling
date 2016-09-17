package nslm2.modules.cultivates.roleTeam.view.render
{
   import game.ui.roleTeam.render.YuanFenItemRenderUI;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.model.HeroModel;
   import com.netease.protobuf.UInt64;
   
   public class YuanFenItemRender extends YuanFenItemRenderUI
   {
       
      
      private var has:Boolean;
      
      public function YuanFenItemRender()
      {
         super();
         addEventListener("click",onClick);
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         if(!has)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.HERO_LESS_ID)),ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(wealthVo)
         {
            if(wealthVo.kind == 30)
            {
               has = HeroModel.ins.checkHeroInTeamOrYuanJun(wealthVo.sid);
            }
            else
            {
               has = HeroModel.ins.checkHasYuanFenItem(wealthVo.extraData as UInt64,wealthVo.sid);
            }
            mask_black.visible = !has;
         }
      }
   }
}
