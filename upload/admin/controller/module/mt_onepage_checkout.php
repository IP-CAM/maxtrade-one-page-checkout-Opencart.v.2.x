<?php
class ControllerModuleMtOnepageCheckout extends Controller {
	private $error = array();

	public function index() {
		/* Load language file. */
		$this->load->language('module/mt_onepage_checkout');

		$this->document->setTitle($this->language->get('heading_title'));

		/* Check if data has been posted back. */
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$this->load->model('setting/setting');

			$this->model_setting_setting->editSetting('mt_onepage_checkout', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->cache->delete('mt_onepage_checkout');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		/* Load language strings. */
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_module'] = $this->language->get('text_module');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_status_small'] = $this->language->get('entry_status_small');
		$data['entry_mail'] = $this->language->get('entry_mail');		
		$data['entry_mail_small'] = $this->language->get('entry_mail_small');		
		$data['entry_zaiavka1_text'] = $this->language->get('entry_zaiavka1_text');
		$data['entry_zaiavka1_text_small'] = $this->language->get('entry_zaiavka1_text_small');
		$data['entry_zaiavka2_text'] = $this->language->get('entry_zaiavka2_text');
		$data['entry_zaiavka2_text_small'] = $this->language->get('entry_zaiavka2_text_small');
		$data['entry_zaiavka3_text'] = $this->language->get('entry_zaiavka3_text');
		$data['entry_zaiavka3_text_small'] = $this->language->get('entry_zaiavka3_text_small');
		$data['entry_jet_vnoska'] = $this->language->get('entry_jet_vnoska');
		$data['entry_jet_vnoska_small'] = $this->language->get('entry_jet_vnoska_small');
		$data['entry_price'] = $this->language->get('entry_price');		
		$data['entry_price_small'] = $this->language->get('entry_price_small');		
		$data['entry_jet_shirina'] = $this->language->get('entry_jet_shirina');
		$data['entry_jet_shirina_small'] = $this->language->get('entry_jet_shirina_small');
		$data['entry_redove'] = $this->language->get('entry_redove');
		$data['entry_redove_small'] = $this->language->get('entry_redove_small');
		$data['entry_jet_purcent'] = $this->language->get('entry_jet_purcent');
		$data['entry_jet_purcent_small'] = $this->language->get('entry_jet_purcent_small');
		$data['jet_entry_file'] = $this->language->get('jet_entry_file');
		$data['jet_entry_file_description'] = $this->language->get('jet_entry_file_description');

		$data['error_price'] = $this->language->get('error_price');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		/* Loading up some URLS. */
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$data['form_action'] = $this->url->link('module/mt_onepage_checkout', 'token=' . $this->session->data['token'], 'SSL');

		/* Present error messages to users. */
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		/* Initial values for form. */
		if (isset($this->request->post['mt_onepage_checkout_status'])) {
			$data['mt_onepage_checkout_status'] = $this->request->post['mt_onepage_checkout_status'];
		} else {
			$data['mt_onepage_checkout_status'] = $this->config->get('mt_onepage_checkout_status');
		}

		/* Breadcrumb. */
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/mt_onepage_checkout', 'token=' . $this->session->data['token'], 'SSL')
		);
	
		/* Render some output. */
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/mt_onepage_checkout.tpl', $data));
	}
}
