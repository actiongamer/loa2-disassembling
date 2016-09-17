package nslm2.modules.cultivates.skin.render
{
   import game.ui.skinModule.render.SkinBookSuitRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcHeroSkinSuitVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.cultivates.skin.SkinModel;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.text.TextFormat;
   
   public class SkinBookSuitRender extends SkinBookSuitRenderUI
   {
       
      
      public function SkinBookSuitRender()
      {
         super();
      }
      
      public function get vo() : StcHeroSkinSuitVo
      {
         return super.dataSource as StcHeroSkinSuitVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc8_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         .super.dataSource = param1;
         if(vo)
         {
            _loc8_ = StcMgr.ins.getVoArrByColumnValue("static_hero_skin_suit","node",int(vo.node)).sortOn("num");
            _loc2_ = StcMgr.ins.getVoArrByMultiColumnValue("static_item",["kind","extend_1"],[14,vo.node]);
            _loc3_ = [];
            _loc2_.sortOn("kind",16);
            _loc7_ = _loc2_.length;
            _loc6_ = 0;
            _loc9_ = 0;
            while(_loc9_ < _loc7_)
            {
               _loc4_ = _loc2_[_loc9_];
               _loc5_ = SkinModel.ins.isActive(_loc4_.id) || SkinModel.ins.isUsed(_loc4_.id);
               if(_loc5_)
               {
                  _loc6_++;
               }
               _loc9_++;
            }
            this.txt_desc.text = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(10000003 + vo.num) + ": " + LocaleMgr.ins.getStr(vo.name) + LocaleMgr.ins.getStr(vo.desc),new TextFormat(null,null,_loc6_ >= vo.num?458496:7566195));
         }
      }
   }
}
