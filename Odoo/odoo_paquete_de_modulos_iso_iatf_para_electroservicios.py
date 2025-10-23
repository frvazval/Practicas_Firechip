# 📦 Estructura del paquete (múltiples módulos Odoo 17)
# Copia y pega estas carpetas en tu repo de addons. Cada módulo es independiente.

# ─────────────────────────────────────────────────────────────────────────────
# MÓDULO: quality_documents
# ─────────────────────────────────────────────────────────────────────────────
# quality_documents/__manifest__.py
{
    'name': 'Quality Documents',
    'summary': 'Control documental ISO/IATF',
    'version': '17.0.1.0.0',
    'author': 'Electroservicios',
    'website': 'https://example.com',
    'license': 'OPL-1',
    'category': 'Quality',
    'depends': ['base', 'mail', 'contacts', 'documents'],
    'data': [
        'security/ir.model.access.csv',
        'data/sequence.xml',
        'views/quality_document_views.xml',
        'views/menu.xml',
    ],
    'installable': True,
    'application': True,
}

# quality_documents/__init__.py
from . import models

# quality_documents/models/__init__.py
from . import quality_document

# quality_documents/models/quality_document.py
from odoo import api, fields, models
from odoo.exceptions import ValidationError

class QualityDocument(models.Model):
    _name = 'quality.document'
    _description = 'Documento de Calidad'
    _inherit = ['mail.thread', 'mail.activity.mixin']
    _order = 'create_date desc'

    name = fields.Char('Título', required=True, tracking=True)
    code = fields.Char('Código', copy=False, default=lambda self: self.env['ir.sequence'].next_by_code('quality.document'))
    tipo = fields.Selection([
        ('manual', 'Manual'),
        ('procedimiento', 'Procedimiento'),
        ('instruccion', 'Instrucción'),
        ('formato', 'Formato'),
        ('otro', 'Otro'),
    ], required=True, tracking=True)
    version = fields.Char('Versión', required=True, tracking=True)
    estado = fields.Selection([
        ('vigente', 'Vigente'),
        ('obsoleto', 'Obsoleto'),
        ('borrador', 'Borrador'),
    ], default='vigente', tracking=True)
    fecha_emision = fields.Date('Fecha de Emisión')
    responsable_id = fields.Many2one('res.partner', 'Responsable', tracking=True)
    observaciones = fields.Text('Observaciones')
    attachment_ids = fields.Many2many('ir.attachment', string='Adjuntos')

    _sql_constraints = [
        ('code_unique', 'unique(code)', 'El código del documento debe ser único.')
    ]

    @api.constrains('version')
    def _check_version(self):
        for rec in self:
            if rec.version and len(rec.version) > 20:
                raise ValidationError('La versión no debe superar 20 caracteres.')

# quality_documents/security/ir.model.access.csv
"id","name","model_id:id","group_id:id","perm_read","perm_write","perm_create","perm_unlink"
"access_quality_document_user","quality.document user","model_quality_document","base.group_user",1,1,1,1

# quality_documents/data/sequence.xml
<odoo>
  <data noupdate="1">
    <record id="seq_quality_document" model="ir.sequence">
      <field name="name">Quality Document</field>
      <field name="code">quality.document</field>
      <field name="prefix">DOC-%(y)s-</field>
      <field name="padding">4</field>
    </record>
  </data>
</odoo>

# quality_documents/views/quality_document_views.xml
<odoo>
  <record id="view_quality_document_tree" model="ir.ui.view">
    <field name="name">quality.document.tree</field>
    <field name="model">quality.document</field>
    <field name="arch" type="xml">
      <tree>
        <field name="code"/>
        <field name="name"/>
        <field name="tipo"/>
        <field name="version"/>
        <field name="estado"/>
        <field name="responsable_id"/>
        <field name="fecha_emision"/>
      </tree>
    </field>
  </record>

  <record id="view_quality_document_form" model="ir.ui.view">
    <field name="name">quality.document.form</field>
    <field name="model">quality.document</field>
    <field name="arch" type="xml">
      <form string="Documento de Calidad">
        <sheet>
          <group>
            <group>
              <field name="code" readonly="1"/>
              <field name="name"/>
              <field name="tipo"/>
              <field name="version"/>
              <field name="estado"/>
            </group>
            <group>
              <field name="responsable_id"/>
              <field name="fecha_emision"/>
            </group>
          </group>
          <notebook>
            <page string="Adjuntos">
              <field name="attachment_ids" widget="many2many_binary"/>
            </page>
            <page string="Observaciones">
              <field name="observaciones"/>
            </page>
          </notebook>
        </sheet>
        <chatter>
          <field name="message_follower_ids"/>
          <field name="activity_ids"/>
          <field name="message_ids"/>
        </chatter>
      </form>
    </field>
  </record>

  <record id="action_quality_document" model="ir.actions.act_window">
    <field name="name">Documentos de Calidad</field>
    <field name="res_model">quality.document</field>
    <field name="view_mode">tree,form</field>
  </record>
</odoo>

# quality_documents/views/menu.xml
<odoo>
  <menuitem id="menu_quality_root" name="Calidad" sequence="10"/>
  <menuitem id="menu_quality_documents" name="Documentos" parent="menu_quality_root" action="action_quality_document"/>
</odoo>


# ─────────────────────────────────────────────────────────────────────────────
# MÓDULO: quality_nc_capa (No conformidades y acciones correctivas)
# ─────────────────────────────────────────────────────────────────────────────
# quality_nc_capa/__manifest__.py
{
    'name': 'Quality NC & CAPA',
    'summary': 'No conformidades y acciones correctivas',
    'version': '17.0.1.0.0',
    'author': 'Electroservicios',
    'license': 'OPL-1',
    'category': 'Quality',
    'depends': ['base', 'mail', 'contacts'],
    'data': [
        'security/ir.model.access.csv',
        'data/sequence.xml',
        'views/nc_views.xml',
        'views/capa_views.xml',
        'views/menu.xml',
    ],
    'installable': True,
    'application': True,
}

# quality_nc_capa/__init__.py
from . import models

# quality_nc_capa/models/__init__.py
from . import no_conformidad
from . import accion_correctiva

# quality_nc_capa/models/no_conformidad.py
from odoo import fields, models

class NoConformidad(models.Model):
    _name = 'quality.nc'
    _description = 'No Conformidad'
    _inherit = ['mail.thread', 'mail.activity.mixin']
    _order = 'create_date desc'

    name = fields.Char('Asunto', required=True, tracking=True)
    code = fields.Char('Código', copy=False, default=lambda self: self.env['ir.sequence'].next_by_code('quality.nc'))
    fecha_detectada = fields.Date('Fecha Detectada', required=True, tracking=True)
    origen = fields.Selection([
        ('cliente','Cliente'),
        ('proveedor','Proveedor'),
        ('proceso_interno','Proceso Interno'),
        ('auditoria','Auditoría')
    ], required=True, tracking=True)
    descripcion = fields.Text('Descripción', required=True)
    responsable_id = fields.Many2one('res.partner', 'Responsable', tracking=True)
    estado = fields.Selection([
        ('abierta','Abierta'),
        ('en_proceso','En proceso'),
        ('cerrada','Cerrada')
    ], default='abierta', tracking=True)
    fecha_cierre = fields.Date('Fecha de Cierre')
    accion_ids = fields.One2many('quality.capa', 'nc_id', string='Acciones Correctivas')

# quality_nc_capa/models/accion_correctiva.py
from odoo import fields, models

class AccionCorrectiva(models.Model):
    _name = 'quality.capa'
    _description = 'Acción Correctiva/Preventiva'
    _inherit = ['mail.thread', 'mail.activity.mixin']
    _order = 'create_date desc'

    name = fields.Char('Descripción', required=True, tracking=True)
    nc_id = fields.Many2one('quality.nc', 'No Conformidad', required=True, ondelete='cascade')
    responsable_id = fields.Many2one('res.partner', 'Responsable')
    fecha_inicio = fields.Date('Fecha Inicio')
    fecha_fin = fields.Date('Fecha Fin')
    estado = fields.Selection([
        ('pendiente','Pendiente'),
        ('en_proceso','En Proceso'),
        ('implementada','Implementada'),
        ('verificada','Verificada')
    ], default='pendiente', tracking=True)

# quality_nc_capa/security/ir.model.access.csv
"id","name","model_id:id","group_id:id","perm_read","perm_write","perm_create","perm_unlink"
"access_quality_nc_user","quality.nc user","model_quality_nc","base.group_user",1,1,1,1
"access_quality_capa_user","quality.capa user","model_quality_capa","base.group_user",1,1,1,1

# quality_nc_capa/data/sequence.xml
<odoo>
  <data noupdate="1">
    <record id="seq_quality_nc" model="ir.sequence">
      <field name="name">No Conformidad</field>
      <field name="code">quality.nc</field>
      <field name="prefix">NC-%(y)s-</field>
      <field name="padding">4</field>
    </record>
  </data>
</odoo>

# quality_nc_capa/views/nc_views.xml
<odoo>
  <record id="view_quality_nc_tree" model="ir.ui.view">
    <field name="name">quality.nc.tree</field>
    <field name="model">quality.nc</field>
    <field name="arch" type="xml">
      <tree>
        <field name="code"/>
        <field name="name"/>
        <field name="origen"/>
        <field name="estado"/>
        <field name="responsable_id"/>
        <field name="fecha_detectada"/>
        <field name="fecha_cierre"/>
      </tree>
    </field>
  </record>

  <record id="view_quality_nc_form" model="ir.ui.view">
    <field name="name">quality.nc.form</field>
    <field name="model">quality.nc</field>
    <field name="arch" type="xml">
      <form string="No Conformidad">
        <sheet>
          <group>
            <group>
              <field name="code" readonly="1"/>
              <field name="name"/>
              <field name="origen"/>
              <field name="estado"/>
            </group>
            <group>
              <field name="responsable_id"/>
              <field name="fecha_detectada"/>
              <field name="fecha_cierre"/>
            </group>
          </group>
          <notebook>
            <page string="Descripción">
              <field name="descripcion"/>
            </page>
            <page string="Acciones">
              <field name="accion_ids">
                <tree editable="bottom">
                  <field name="name"/>
                  <field name="responsable_id"/>
                  <field name="estado"/>
                  <field name="fecha_inicio"/>
                  <field name="fecha_fin"/>
                </tree>
              </field>
            </page>
          </notebook>
        </sheet>
        <chatter>
          <field name="message_follower_ids"/>
          <field name="activity_ids"/>
          <field name="message_ids"/>
        </chatter>
      </form>
    </field>
  </record>

  <record id="action_quality_nc" model="ir.actions.act_window">
    <field name="name">No Conformidades</field>
    <field name="res_model">quality.nc</field>
    <field name="view_mode">tree,form</field>
  </record>
</odoo>

# quality_nc_capa/views/capa_views.xml
<odoo>
  <record id="view_quality_capa_tree" model="ir.ui.view">
    <field name="name">quality.capa.tree</field>
    <field name="model">quality.capa</field>
    <field name="arch" type="xml">
      <tree>
        <field name="name"/>
        <field name="nc_id"/>
        <field name="responsable_id"/>
        <field name="estado"/>
        <field name="fecha_inicio"/>
        <field name="fecha_fin"/>
      </tree>
    </field>
  </record>

  <record id="view_quality_capa_form" model="ir.ui.view">
    <field name="name">quality.capa.form</field>
    <field name="model">quality.capa</field>
    <field name="arch" type="xml">
      <form string="Acción Correctiva/Preventiva">
        <sheet>
          <group>
            <field name="nc_id"/>
            <field name="name"/>
            <field name="responsable_id"/>
            <field name="estado"/>
            <field name="fecha_inicio"/>
            <field name="fecha_fin"/>
          </group>
        </sheet>
        <chatter>
          <field name="message_follower_ids"/>
          <field name="activity_ids"/>
          <field name="message_ids"/>
        </chatter>
      </form>
    </field>
  </record>

  <menuitem id="menu_quality_nc_root" name="Calidad" sequence="10"/>
  <menuitem id="menu_quality_nc" name="No Conformidades" parent="menu_quality_nc_root" action="action_quality_nc"/>
</odoo>

# quality_nc_capa/views/menu.xml
<odoo>
  <menuitem id="menu_quality_capa" name="Acciones Correctivas" parent="menu_quality_nc_root" action="action_quality_capa"/>
  <record id="action_quality_capa" model="ir.actions.act_window">
    <field name="name">Acciones Correctivas</field>
    <field name="res_model">quality.capa</field>
    <field name="view_mode">tree,form</field>
  </record>
</odoo>


# ─────────────────────────────────────────────────────────────────────────────
# MÓDULO: quality_audits
# ─────────────────────────────────────────────────────────────────────────────
# quality_audits/__manifest__.py
{
    'name': 'Quality Audits',
    'summary': 'Auditorías de calidad y hallazgos',
    'version': '17.0.1.0.0',
    'author': 'Electroservicios',
    'license': 'OPL-1',
    'category': 'Quality',
    'depends': ['base', 'mail', 'contacts'],
    'data': [
        'security/ir.model.access.csv',
        'data/sequence.xml',
        'views/audit_views.xml',
        'views/finding_views.xml',
        'views/menu.xml',
    ],
    'installable': True,
    'application': True,
}

# quality_audits/__init__.py
from . import models

# quality_audits/models/__init__.py
from . import audit
from . import finding

# quality_audits/models/audit.py
from odoo import fields, models

class QualityAudit(models.Model):
    _name = 'quality.audit'
    _description = 'Auditoría de Calidad'
    _inherit = ['mail.thread', 'mail.activity.mixin']
    _order = 'date desc'

    name = fields.Char('Nombre/Referencia', required=True)
    code = fields.Char('Código', copy=False, default=lambda self: self.env['ir.sequence'].next_by_code('quality.audit'))
    tipo = fields.Selection([
        ('interna','Interna'),
        ('externa','Externa'),
        ('proveedor','Proveedor')
    ], required=True, tracking=True)
    date = fields.Date('Fecha', required=True, tracking=True)
    auditor = fields.Char('Auditor')
    norma_aplicable = fields.Selection([
        ('ISO9001','ISO 9001'),
        ('IATF16949','IATF 16949'),
        ('otro','Otro')
    ])
    estado = fields.Selection([
        ('planificada','Planificada'),
        ('realizada','Realizada'),
        ('cerrada','Cerrada')
    ], default='planificada', tracking=True)
    informe = fields.Text('Informe')
    finding_ids = fields.One2many('quality.audit.finding', 'audit_id', string='Hallazgos')

# quality_audits/models/finding.py
from odoo import fields, models

class AuditFinding(models.Model):
    _name = 'quality.audit.finding'
    _description = 'Hallazgo de Auditoría'
    _inherit = ['mail.thread', 'mail.activity.mixin']
    _order = 'create_date desc'

    audit_id = fields.Many2one('quality.audit', 'Auditoría', required=True, ondelete='cascade')
    descripcion = fields.Text('Descripción', required=True)
    clasificacion = fields.Selection([
        ('observacion','Observación'),
        ('no_conformidad_menor','NC Menor'),
        ('no_conformidad_mayor','NC Mayor'),
    ], required=True)
    responsable_id = fields.Many2one('res.partner', 'Responsable')
    estado = fields.Selection([
        ('pendiente','Pendiente'),
        ('en_proceso','En Proceso'),
        ('cerrado','Cerrado')
    ], default='pendiente')

# quality_audits/security/ir.model.access.csv
"id","name","model_id:id","group_id:id","perm_read","perm_write","perm_create","perm_unlink"
"access_quality_audit_user","quality.audit user","model_quality_audit","base.group_user",1,1,1,1
"access_quality_audit_finding_user","quality.audit.finding user","model_quality_audit_finding","base.group_user",1,1,1,1

# quality_audits/data/sequence.xml
<odoo>
  <data noupdate="1">
    <record id="seq_quality_audit" model="ir.sequence">
      <field name="name">Auditoría</field>
      <field name="code">quality.audit</field>
      <field name="prefix">AUD-%(y)s-</field>
      <field name="padding">4</field>
    </record>
  </data>
</odoo>

# quality_audits/views/audit_views.xml
<odoo>
  <record id="view_quality_audit_tree" model="ir.ui.view">
    <field name="name">quality.audit.tree</field>
    <field name="model">quality.audit</field>
    <field name="arch" type="xml">
      <tree>
        <field name="code"/>
        <field name="name"/>
        <field name="tipo"/>
        <field name="date"/>
        <field name="estado"/>
      </tree>
    </field>
  </record>

  <record id="view_quality_audit_form" model="ir.ui.view">
    <field name="name">quality.audit.form</field>
    <field name="model">quality.audit</field>
    <field name="arch" type="xml">
      <form string="Auditoría">
        <sheet>
          <group>
            <field name="code" readonly="1"/>
            <field name="name"/>
            <field name="tipo"/>
            <field name="date"/>
            <field name="norma_aplicable"/>
            <field name="estado"/>
            <field name="auditor"/>
          </group>
          <notebook>
            <page string="Hallazgos">
              <field name="finding_ids">
                <tree editable="bottom">
                  <field name="descripcion"/>
                  <field name="clasificacion"/>
                  <field name="responsable_id"/>
                  <field name="estado"/>
                </tree>
              </field>
            </page>
            <page string="Informe">
              <field name="informe"/>
            </page>
          </notebook>
        </sheet>
        <chatter>
          <field name="message_follower_ids"/>
          <field name="activity_ids"/>
          <field name="message_ids"/>
        </chatter>
      </form>
    </field>
  </record>

  <record id="action_quality_audit" model="ir.actions.act_window">
    <field name="name">Auditorías</field>
    <field name="res_model">quality.audit</field>
    <field name="view_mode">tree,form</field>
  </record>
</odoo>

# quality_audits/views/finding_views.xml
<odoo>
  <record id="view_quality_audit_finding_tree" model="ir.ui.view">
    <field name="name">quality.audit.finding.tree</field>
    <field name="model">quality.audit.finding</field>
    <field name="arch" type="xml">
      <tree>
        <field name="audit_id"/>
        <field name="clasificacion"/>
        <field name="responsable_id"/>
        <field name="estado"/>
      </tree>
    </field>
  </record>

  <record id="view_quality_audit_finding_form" model="ir.ui.view">
    <field name="name">quality.audit.finding.form</field>
    <field name="model">quality.audit.finding</field>
    <field name="arch" type="xml">
      <form string="Hallazgo">
        <sheet>
          <group>
            <field name="audit_id"/>
            <field name="clasificacion"/>
            <field name="responsable_id"/>
            <field name="estado"/>
          </group>
          <group>
            <field name="descripcion"/>
          </group>
        </sheet>
        <chatter>
          <field name="message_follower_ids"/>
          <field name="activity_ids"/>
          <field name="message_ids"/>
        </chatter>
      </form>
    </field>
  </record>
</odoo>

# quality_audits/views/menu.xml
<odoo>
  <menuitem id="menu_quality_audit_root" name="Calidad" sequence="10"/>
  <menuitem id="menu_quality_audit" name="Auditorías" parent="menu_quality_audit_root" action="action_quality_audit"/>
</odoo>


# ─────────────────────────────────────────────────────────────────────────────
# MÓDULO: quality_supplier_eval
# ─────────────────────────────────────────────────────────────────────────────
# quality_supplier_eval/__manifest__.py
{
    'name': 'Quality Supplier Evaluation',
    'summary': 'Evaluación de Proveedores',
    'version': '17.0.1.0.0',
    'author': 'Electroservicios',
    'license': 'OPL-1',
    'category': 'Quality',
    'depends': ['base', 'mail', 'contacts', 'purchase'],
    'data': [
        'security/ir.model.access.csv',
        'views/supplier_eval_views.xml',
        'views/menu.xml',
    ],
    'installable': True,
}

# quality_supplier_eval/__init__.py
from . import models

# quality_supplier_eval/models/__init__.py
from . import supplier_eval

# quality_supplier_eval/models/supplier_eval.py
from odoo import fields, models

class SupplierEvaluation(models.Model):
    _name = 'quality.supplier.eval'
    _description = 'Evaluación de Proveedor'
    _inherit = ['mail.thread', 'mail.activity.mixin']
    _order = 'date desc'

    partner_id = fields.Many2one('res.partner', 'Proveedor', required=True, domain="[('supplier_rank','>',0)]")
    date = fields.Date('Fecha', required=True)
    criterio_calidad = fields.Integer('Calidad', help='0-100')
    criterio_entrega = fields.Integer('Entrega', help='0-100')
    criterio_costo = fields.Integer('Costo', help='0-100')
    resultado = fields.Selection([
        ('aprobado','Aprobado'),
        ('condicional','Condicional'),
        ('rechazado','Rechazado')
    ])
    comentarios = fields.Text('Comentarios')

# quality_supplier_eval/security/ir.model.access.csv
"id","name","model_id:id","group_id:id","perm_read","perm_write","perm_create","perm_unlink"
"access_quality_supplier_eval_user","quality.supplier.eval user","model_quality_supplier_eval","base.group_user",1,1,1,1

# quality_supplier_eval/views/supplier_eval_views.xml
<odoo>
  <record id="view_quality_supplier_eval_tree" model="ir.ui.view">
    <field name="name">quality.supplier.eval.tree</field>
    <field name="model">quality.supplier.eval</field>
    <field name="arch" type="xml">
      <tree>
        <field name="partner_id"/>
        <field name="date"/>
        <field name="criterio_calidad"/>
        <field name="criterio_entrega"/>
        <field name="criterio_costo"/>
        <field name="resultado"/>
      </tree>
    </field>
  </record>

  <record id="view_quality_supplier_eval_form" model="ir.ui.view">
    <field name="name">quality.supplier.eval.form</field>
    <field name="model">quality.supplier.eval</field>
    <field name="arch" type="xml">
      <form string="Evaluación de Proveedor">
        <sheet>
          <group>
            <field name="partner_id"/>
            <field name="date"/>
            <field name="resultado"/>
          </group>
          <group string="Criterios (0-100)">
            <field name="criterio_calidad"/>
            <field name="criterio_entrega"/>
            <field name="criterio_costo"/>
          </group>
          <group>
            <field name="comentarios"/>
          </group>
        </sheet>
        <chatter>
          <field name="message_follower_ids"/>
          <field name="activity_ids"/>
          <field name="message_ids"/>
        </chatter>
      </form>
    </field>
  </record>

  <record id="action_quality_supplier_eval" model="ir.actions.act_window">
    <field name="name">Evaluaciones de Proveedores</field>
    <field name="res_model">quality.supplier.eval</field>
    <field name="view_mode">tree,form</field>
  </record>
</odoo>

# quality_supplier_eval/views/menu.xml
<odoo>
  <menuitem id="menu_quality_supplier_eval_root" name="Calidad" sequence="10"/>
  <menuitem id="menu_quality_supplier_eval" name="Evaluación Proveedores" parent="menu_quality_supplier_eval_root" action="action_quality_supplier_eval"/>
</odoo>


# ─────────────────────────────────────────────────────────────────────────────
# MÓDULO: quality_kpi
# ─────────────────────────────────────────────────────────────────────────────
# quality_kpi/__manifest__.py
{
    'name': 'Quality KPI',
    'summary': 'Indicadores de calidad',
    'version': '17.0.1.0.0',
    'author': 'Electroservicios',
    'license': 'OPL-1',
    'category': 'Quality',
    'depends': ['base', 'mail'],
    'data': [
        'security/ir.model.access.csv',
        'views/kpi_views.xml',
        'views/menu.xml',
    ],
    'installable': True,
}

# quality_kpi/__init__.py
from . import models

# quality_kpi/models/__init__.py
from . import kpi

# quality_kpi/models/kpi.py
from odoo import fields, models

class QualityKPI(models.Model):
    _name = 'quality.kpi'
    _description = 'Indicador de Calidad'
    _inherit = ['mail.thread', 'mail.activity.mixin']
    _order = 'periodo desc'

    name = fields.Char('Nombre', required=True)
    descripcion = fields.Text('Descripción')
    unidad_medida = fields.Char('Unidad de Medida')
    meta = fields.Float('Meta')
    valor_actual = fields.Float('Valor Actual')
    periodo = fields.Date('Periodo')
    responsable_id = fields.Many2one('res.partner', 'Responsable')

# quality_kpi/security/ir.model.access.csv
"id","name","model_id:id","group_id:id","perm_read","perm_write","perm_create","perm_unlink"
"access_quality_kpi_user","quality.kpi user","model_quality_kpi","base.group_user",1,1,1,1

# quality_kpi/views/kpi_views.xml
<odoo>
  <record id="view_quality_kpi_tree" model="ir.ui.view">
    <field name="name">quality.kpi.tree</field>
    <field name="model">quality.kpi</field>
    <field name="arch" type="xml">
      <tree>
        <field name="name"/>
        <field name="periodo"/>
        <field name="valor_actual"/>
        <field name="meta"/>
        <field name="unidad_medida"/>
        <field name="responsable_id"/>
      </tree>
    </field>
  </record>

  <record id="view_quality_kpi_form" model="ir.ui.view">
    <field name="name">quality.kpi.form</field>
    <field name="model">quality.kpi</field>
    <field name="arch" type="xml">
      <form string="Indicador">
        <sheet>
          <group>
            <field name="name"/>
            <field name="periodo"/>
            <field name="responsable_id"/>
          </group>
          <group>
            <field name="meta"/>
            <field name="valor_actual"/>
            <field name="unidad_medida"/>
          </group>
          <group>
            <field name="descripcion"/>
          </group>
        </sheet>
        <chatter>
          <field name="message_follower_ids"/>
          <field name="activity_ids"/>
          <field name="message_ids"/>
        </chatter>
      </form>
    </field>
  </record>

  <record id="action_quality_kpi" model="ir.actions.act_window">
    <field name="name">Indicadores</field>
    <field name="res_model">quality.kpi</field>
    <field name="view_mode">tree,form</field>
  </record>
</odoo>

# quality_kpi/views/menu.xml
<odoo>
  <menuitem id="menu_quality_kpi_root" name="Calidad" sequence="10"/>
  <menuitem id="menu_quality_kpi" name="Indicadores" parent="menu_quality_kpi_root" action="action_quality_kpi"/>
</odoo>


# ─────────────────────────────────────────────────────────────────────────────
# MÓDULO: quality_risks
# ─────────────────────────────────────────────────────────────────────────────
# quality_risks/__manifest__.py
{
    'name': 'Quality Risks',
    'summary': 'Riesgos y oportunidades',
    'version': '17.0.1.0.0',
    'author': 'Electroservicios',
    'license': 'OPL-1',
    'category': 'Quality',
    'depends': ['base', 'mail', 'contacts'],
    'data': [
        'security/ir.model.access.csv',
        'views/risk_views.xml',
        'views/menu.xml',
    ],
    'installable': True,
}

# quality_risks/__init__.py
from . import models

# quality_risks/models/__init__.py
from . import risk

# quality_risks/models/risk.py
from odoo import fields, models

class QualityRisk(models.Model):
    _name = 'quality.risk'
    _description = 'Riesgo / Oportunidad'
    _inherit = ['mail.thread', 'mail.activity.mixin']
    _order = 'create_date desc'

    tipo = fields.Selection([
        ('riesgo','Riesgo'),
        ('oportunidad','Oportunidad')
    ], required=True, tracking=True)
    descripcion = fields.Text('Descripción', required=True)
    probabilidad = fields.Selection([
        ('baja','Baja'),
        ('media','Media'),
        ('alta','Alta')
    ], required=True)
    impacto = fields.Selection([
        ('bajo','Bajo'),
        ('medio','Medio'),
        ('alto','Alto')
    ], required=True)
    plan_accion = fields.Text('Plan de Acción')
    responsable_id = fields.Many2one('res.partner', 'Responsable')
    estado = fields.Selection([
        ('abierto','Abierto'),
        ('en_proceso','En Proceso'),
        ('cerrado','Cerrado')
    ], default='abierto', tracking=True)

# quality_risks/security/ir.model.access.csv
"id","name","model_id:id","group_id:id","perm_read","perm_write","perm_create","perm_unlink"
"access_quality_risk_user","quality.risk user","model_quality_risk","base.group_user",1,1,1,1

# quality_risks/views/risk_views.xml
<odoo>
  <record id="view_quality_risk_tree" model="ir.ui.view">
    <field name="name">quality.risk.tree</field>
    <field name="model">quality.risk</field>
    <field name="arch" type="xml">
      <tree>
        <field name="tipo"/>
        <field name="descripcion"/>
        <field name="probabilidad"/>
        <field name="impacto"/>
        <field name="estado"/>
        <field name="responsable_id"/>
      </tree>
    </field>
  </record>

  <record id="view_quality_risk_form" model="ir.ui.view">
    <field name="name">quality.risk.form</field>
    <field name="model">quality.risk</field>
    <field name="arch" type="xml">
      <form string="Riesgo/Oportunidad">
        <sheet>
          <group>
            <field name="tipo"/>
            <field name="estado"/>
            <field name="responsable_id"/>
          </group>
          <group>
            <field name="probabilidad"/>
            <field name="impacto"/>
          </group>
          <group>
            <field name="descripcion"/>
            <field name="plan_accion"/>
          </group>
        </sheet>
        <chatter>
          <field name="message_follower_ids"/>
          <field name="activity_ids"/>
          <field name="message_ids"/>
        </chatter>
      </form>
    </field>
  </record>

  <record id="action_quality_risk" model="ir.actions.act_window">
    <field name="name">Riesgos</field>
    <field name="res_model">quality.risk</field>
    <field name="view_mode">tree,form</field>
  </record>
</odoo>

# quality_risks/views/menu.xml
<odoo>
  <menuitem id="menu_quality_risk_root" name="Calidad" sequence="10"/>
  <menuitem id="menu_quality_risk" name="Riesgos y Oportunidades" parent="menu_quality_risk_root" action="action_quality_risk"/>
</odoo>


# ─────────────────────────────────────────────────────────────────────────────
# NOTAS DE INTEGRACIÓN Y MAPEOS
# ─────────────────────────────────────────────────────────────────────────────
# • entidades -> res.partner (añadir campos x_rol, x_tipo, x_estado si usas Odoo Studio).
# • productos/movimientos_stock -> módulos nativos product/stock.
# • servicios -> helpdesk.ticket o maintenance.request (añadir campos SLA, prioridad, etc.).
# • facturas -> account.move/account.move.line.
# • adjuntos -> ir.attachment; comentarios -> mail.message (nativo en chatter).
# • Fichas PDF -> usar quality_documents con attachment_ids o módulo Documents.

# FIN DEL PAQUETE
