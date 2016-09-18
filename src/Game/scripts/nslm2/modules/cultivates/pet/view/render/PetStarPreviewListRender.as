package nslm2.modules.cultivates.pet.view.render
{
   import game.ui.petModule.comps.PetStarPreViewListRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcPetStarVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.cultivates.pet.util.PetUtil;
   
   public class PetStarPreviewListRender extends PetStarPreViewListRenderUI
   {
       
      
      private var _data:StcPetStarVo;
      
      public function PetStarPreviewListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as StcPetStarVo;
         if(_data)
         {
            txt_nextStar.text = LocaleMgr.ins.getStr(32000040,[_data.level]);
            list_nextProp.dataSource = NpcPropVo.parseArrStr(_data.attr,"+");
            posBuffViewNext.list_petBuff.dataSource = PetUtil.getPosBuffArr(_data.node,_data.level,"+");
         }
      }
   }
}
