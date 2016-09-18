package nslm2.modules.funnies.teamPKCS.finalMatch
{
   import nslm2.modules.scenes.commons.Unit3DBase;
   import proto.PlayerBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.common.model.PlayerModel;
   import com.greensock.TweenLite;
   import com.game.shared.component.NameTag3D;
   import morn.core.components.Label;
   import flash.display.BitmapData;
   import morn.core.utils.BitmapUtils;
   
   public class TPKCFinalUnit3D extends Unit3DBase
   {
       
      
      public var _nameTag:NameTag3D;
      
      public function TPKCFinalUnit3D()
      {
         super();
      }
      
      public function changeView(param1:PlayerBaseInfo) : void
      {
         box3D2.visible = true;
         overMethodEnabled = true;
         buttonMode = true;
         var _loc6_:int = param1.npcId;
         var _loc3_:int = param1.clothes;
         var _loc2_:int = param1.wing;
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(_loc6_);
         var _loc4_:int = _loc5_.sex;
         PlayerModel.ins.changePlayerViewByPlayerBaseInfo(this,param1);
         this.box3D2.scaleAll = 0.9;
         this.avatar.alpha = 0;
         this.visible = true;
         TweenLite.to(this.avatar,0.5,{"alpha":1});
         this.mouseEnabled = true;
         this.mouseChildren = true;
      }
      
      public function showName(param1:String) : void
      {
         if(_nameTag == null)
         {
            _nameTag = new NameTag3D();
            tag3DVBox.addChild(_nameTag);
         }
         var _loc2_:Label = new Label();
         _loc2_.style = "渐变1";
         _loc2_.text = param1;
         _loc2_.width = 100;
         _loc2_.height = 24;
         _loc2_.commitMeasure();
         var _loc3_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         _loc3_.draw(_loc2_,null,null,null,null,true);
         _loc3_ = BitmapUtils.transparentCut(_loc3_);
         _nameTag.setBitmapData(_loc3_,true);
         _loc2_.dispose();
      }
      
      override public function dispose() : void
      {
         if(_nameTag)
         {
            _nameTag.dispose();
            _nameTag = null;
         }
         super.dispose();
      }
   }
}
