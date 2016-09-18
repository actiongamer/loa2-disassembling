package nslm2.modules.roleInfos.commons
{
   import com.mz.core.interFace.IFadeView;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import morn.core.components.View;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   
   public interface IRoleSubPanel extends IFadeView
   {
       
      
      function set modelRef(param1:RoleInfoModel) : void;
      
      function get subBarRef() : View;
      
      function show(param1:Boolean = false) : void;
      
      function set layer3dRef(param1:UIPanel3D) : void;
   }
}
