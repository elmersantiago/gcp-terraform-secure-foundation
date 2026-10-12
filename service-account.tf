
resource "google_service_account" "vm" {
  account_id   = "secure-foundation-vm"
  display_name = "Secure Foundation VM"
  description  = "Dedicated identity for the private Compute Engine VM"
}
