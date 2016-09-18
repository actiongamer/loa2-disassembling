package nslm2.modules.Chapters.elite
{
   import game.ui.chapters.eliteDungeon.EliteInvadeMonsterRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcEliteStageInvadeVo;
   import proto.EliteInvade;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.Chapters.EliteInvadeModel;
   import com.mz.core.utils.FilterUtil;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import flash.events.MouseEvent;
   import nslm2.modules.Chapters.ShowStageInfoVo;
   import flash.geom.Point;
   import com.mz.core.event.MzEvent;
   
   public class EliteInvadeMonsterRender extends EliteInvadeMonsterRenderUI
   {
       
      
      private var _eliteVo:StcEliteStageInvadeVo;
      
      public function EliteInvadeMonsterRender()
      {
         super();
         this.addEventListener("click",onMouseClick);
      }
      
      private function get eliteVo() : StcEliteStageInvadeVo
      {
         return _eliteVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc2_:Number = NaN;
         if(param1)
         {
            _loc4_ = (param1 as EliteInvade).id;
            _eliteVo = StcMgr.ins.getEliteStageInvadeVo(_loc4_);
            _loc5_ = StcMgr.ins.getChapterVo(eliteVo.chapter_id);
            _loc3_ = StcMgr.ins.getNpcGroupVo(eliteVo.npc_group_id);
            this.txt_chapterName.text = LocaleMgr.ins.getStr(_loc5_.name);
            if(EliteInvadeModel.ins.isFinished(_eliteVo.id))
            {
               this.img_finished.visible = true;
               this.filters = [FilterUtil.grayFilter()];
               DisplayUtils.mouseEnabled(this,false);
            }
            else
            {
               this.img_finished.visible = false;
               this.filters = null;
               DisplayUtils.mouseEnabled(this,true);
            }
            _loc2_ = EliteInvadeModel.ins.getLeftHpPercent(_loc4_);
            this.progressBar.value = _loc2_;
            this.progressBar.label = LocaleConsts.percentStr(_loc2_);
            this.box_exceptIconQuality.visible = true;
            this.buttonMode = true;
            .super.dataSource = _loc3_.head_id;
         }
         else
         {
            this.buttonMode = false;
            this.box_exceptIconQuality.visible = false;
         }
      }
      
      override protected function validateQuality() : void
      {
         if(this.ref_img_quality && this.ori_img_quality_skin)
         {
            if(wealthVo && wealthVo.kind != 0)
            {
               if(wealthVo.stcItemVo && wealthVo.stcItemVo.kind == 51)
               {
                  this.ref_img_quality.skin = "png.a5.bgs.iconBgs.equipPieces.img_EquipPiece_" + eliteVo.quality;
               }
               else
               {
                  this.ref_img_quality.skin = ori_img_quality_skin + eliteVo.quality;
               }
            }
         }
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         var _loc2_:ShowStageInfoVo = new ShowStageInfoVo();
         _loc2_.point = new Point(this.x,this.y);
         _loc2_.id = this.eliteVo.id;
         this.dispatchEvent(new MzEvent("evtShowStageInfo",_loc2_,true));
      }
   }
}
