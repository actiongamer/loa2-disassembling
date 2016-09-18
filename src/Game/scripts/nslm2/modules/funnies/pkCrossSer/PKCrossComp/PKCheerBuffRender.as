package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import game.ui.commons.icons.SkillRenderS2UI;
   import proto.CrossArenaCheerInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcCrossArenaCheerVo;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class PKCheerBuffRender extends SkillRenderS2UI
   {
       
      
      public function PKCheerBuffRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(param1)
         {
            _loc4_ = param1 as CrossArenaCheerInfo;
            _loc3_ = StcMgr.ins.getCrossArenaCheerVo(_loc4_.cheerId);
            _loc2_ = StcMgr.ins.getBuffVo(_loc3_.buff_id);
            this.img_icon.skin = UrlLib.buffIcon(int(_loc2_.icon_id));
            if(_loc4_.level <= 0)
            {
               this.disabled = true;
               this.txt_level.text = "";
            }
            else
            {
               this.disabled = false;
               this.txt_level.text = _loc4_.level + "";
            }
         }
      }
   }
}
