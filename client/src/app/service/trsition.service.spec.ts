import { TestBed } from '@angular/core/testing';

import { TrsitionService } from './trsition.service';

describe('TrsitionService', () => {
  let service: TrsitionService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TrsitionService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
