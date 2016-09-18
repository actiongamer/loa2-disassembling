package nslm2.modules.roleInfos.awake.render
{
   import game.ui.roleInfos.awake.render.RoleAwakePropRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcGridPageVo;
   import morn.core.utils.ObjectUtils;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   
   public class RoleAwakePropRender extends RoleAwakePropRenderUI
   {
       
      
      private var _grey:Boolean;
      
      private var _vo:StcGridPageVo;
      
      public function RoleAwakePropRender()
      {
         super();
      }
      
      public function get vo() : StcGridPageVo
      {
         return _vo;
      }
      
      public function set grey(param1:Boolean) : void
      {
         _grey = param1;
         ObjectUtils.gray(this,param1);
      }
      
      public function get grey() : Boolean
      {
         return _grey;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1 as StcGridPageVo)
         {
            _vo = param1 as StcGridPageVo;
         }
         if(this.vo)
         {
            _loc2_ = NpcPropVo.parseStr(vo.angle_attr);
            this.prop_name.text = NPCPropConsts.ins.getLocaleNameNormal(_loc2_.propId);
            this.prop_value.text = TextFieldUtil.htmlText("+" + (_loc2_.value < 1?int(_loc2_.value * 1000) / 10 + "%":_loc2_.value),new TextFormat(null,null,458496));
         }
      }
   }
}
