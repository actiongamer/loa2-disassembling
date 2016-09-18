package nslm2.modules.Chapters.elite
{
   import nslm2.modules.Chapters.DungeonInfoPanel;
   import nslm2.mgrs.stcMgrs.vos.StcEliteStageInvadeVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.modules.dungeons.EliteDungeonVo;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.Chapters.ChapterModuleInitVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class EliteInvadeInfoPanel extends DungeonInfoPanel
   {
       
      
      private var _stcEliteVo:StcEliteStageInvadeVo;
      
      public function EliteInvadeInfoPanel()
      {
         super();
         this.panelFadeOutType = 2;
      }
      
      public function get eliteVo() : StcEliteStageInvadeVo
      {
         return _stcEliteVo;
      }
      
      override public function show(param1:Object = null) : void
      {
         tsms.toState(5);
         _stcEliteVo = StcMgr.ins.getEliteStageInvadeVo(param1 as int);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(StcMgr.ins.getStageVo(_stcEliteVo.stage_id).name);
         this.render_gold.wealthVo = WealthUtil.needVo(1,0,eliteVo.reward_gold);
         this.render_exp.wealthVo = WealthUtil.needVo(10,0,eliteVo.reward_exp);
         this.txt_des.text = LocaleMgr.ins.getStr(StcMgr.ins.getStageVo(_stcEliteVo.stage_id).description);
         var _loc3_:Array = [WealthUtil.createItemVo(eliteVo.reward_item)];
         this.list_item.dataSource = _loc3_;
         this.list_star.visible = false;
         var _loc2_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(eliteVo.npc_group_id);
         this.img_icon.url = UrlLib.headIcon(_loc2_.head_id.toString());
         this.txt_npcName.text = LocaleMgr.ins.getStr(_loc2_.name);
         _fightRender.changeView(UrlLib.itemMiniIcon(2),LocaleMgr.ins.getStr(40400015,[TextFieldUtil.htmlText(eliteVo.cost_stamina,new TextFormat(null,null,458496))]));
         this.txt_leftTimesDes.text = LocaleMgr.ins.getStr(999000037);
         this.txt_leftTimes.text = LocaleMgr.ins.getStr(999000038);
      }
      
      override protected function fight() : void
      {
         var _loc1_:* = null;
         if(ChapterModel.ins.canEnterStage(this.eliteVo.stage_id) == false)
         {
            return;
         }
         _loc1_ = new EliteDungeonVo(this.eliteVo.id);
         _loc1_.dropGold = this.eliteVo.reward_gold;
         GlobalRef.mainCityReshowParam.chapterModuleInitVo = new ChapterModuleInitVo(this.eliteVo.chapter_id,0,false);
         ModuleMgr.ins.showModule(40405,{"vo":_loc1_});
      }
   }
}
